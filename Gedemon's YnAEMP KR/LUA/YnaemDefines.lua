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
		[GIANT_EARTH] = 				{ID = GIANT_EARTH, 					File = "Yagem.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]지구[ENDCOLOR] ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 							Description = "Genghis Kai의 지구 지도", 																		Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Yagem",},
		[HUGE_EARTH] = 					{ID = HUGE_EARTH, 					File = "Yahem.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]지구[ENDCOLOR] ([COLOR_CYAN]거대[ENDCOLOR])", 							Description = "Dale의 유럽을 확대한 지구 지도", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Yahem" },
		[LARGE_GREATEST_EARTH] = 		{ID = LARGE_GREATEST_EARTH, 		File = "GreatestEarth.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]지구:[ENDCOLOR] 가장 ([COLOR_CYAN]넓음[ENDCOLOR])", 					Description = "djvandyke의 지구 지도", 																		Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "GreatestEarth" },
		-- [STANDARD_EARTH] = 				{ID = EARTH_STANDARD, 				File = "Earth_Standard.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]지구[ENDCOLOR] ([COLOR_CYAN]표준[ENDCOLOR])", 						Description = "Greizer85의 표준 지구", 																	Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "EarthStandard" },
		[STANDARD_CORDIFORM_EARTH] = 	{ID = STANDARD_CORDIFORM_EARTH, 	File = "Cordiform.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]지구:[ENDCOLOR] 심장 모양의 ([COLOR_CYAN]표준[ENDCOLOR])", 				Description = "smellymummy의 베르너 투영법을 사용한 지구 지도", 											Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Cordiform" },
		[AFRICA_ASIA_OCEANIA] = 		{ID = AFRICA_ASIA_OCEANIA, 			File = "AfriAsiaAust.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]지구:[ENDCOLOR] 아프리카, 아시아 & 호주. ([COLOR_CYAN]거대[ENDCOLOR])", 		Description = "???의 아프리카, 아시아, 호주 지도", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AfriAsiaAust" },
		[AFRICA_SOUTH_EUROPE] = 		{ID = AFRICA_SOUTH_EUROPE, 			File = "AfriSouthEuro.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]아프리카:[ENDCOLOR] 아프리카 & 남유럽 ([COLOR_CYAN]넓음[ENDCOLOR])",	Description = "???의 아프리카와 남부 유럽 지도", 														Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "AfriSouthEuro" },
		[AFRICA_GIANT] = 				{ID = AFRICA_GIANT,					File = "AfriGiant.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아프리카[ENDCOLOR] ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 							Description = "Imperator/Elite999의 아프리카 지도", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AfriGiant" },
		[GIANT_EUROPE] = 				{ID = GIANT_EUROPE,					File = "EuroGiant.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]유럽[ENDCOLOR] ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 							Description = "Damasc의 유럽 지도", 																			Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "EuroGiant" },
		[LARGE_EUROPE] = 				{ID = LARGE_EUROPE,					File = "EuroLarge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]유럽[ENDCOLOR] ([COLOR_CYAN]넓음[ENDCOLOR])", 							Description = "Dieter VonClam의 유럽 지도",																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "EuroLarge" },
		[LARGE_EUROPE_NEW] = 			{ID = LARGE_EUROPE_NEW, 			File = "EuroLargeNew.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 가장 ([COLOR_CYAN]넓음[ENDCOLOR])", 				Description = "JanBoruta의 유럽 지도", 																		Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "EuroLargeNew" },
		[EASTERN_EUROPE] = 				{ID = EASTERN_EUROPE, 				File = "EuroEastern.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 동부 ([COLOR_CYAN]넓음[ENDCOLOR])", 					Description = "Lungora의 동유럽 지도",  																Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "EuroEastern" },
		[NORTH_SEA_EUROPE] = 			{ID = NORTH_SEA_EUROPE, 			File = "NorthSeaEurope.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 북해 ([COLOR_CYAN]거대[ENDCOLOR])", 				Description = "Lungora의 북해 지도", 																	Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16,	TablePrefix = "NorthSeaEurope" },
		[NORTHWEST_EUROPE] = 			{ID = NORTHWEST_EUROPE, 			File = "NorthWestEurope.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 북서부 ([COLOR_CYAN]작음[ENDCOLOR])", 				Description = "jordie의 북서유럽 지도", 																Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16,	TablePrefix = "NorthWestEurope" },
		[AEGEAN] = 						{ID = AEGEAN, 						File = "Aegean.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 에게해 ([COLOR_CYAN]표준[ENDCOLOR])", 				Description = "Evanescence의 그리스와 아나톨리아 지도", 														Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Aegean" },
		[APENNINE] = 					{ID = APENNINE, 					File = "Apennine.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 아펜니노 산맥 ([COLOR_CYAN]표준[ENDCOLOR])", 				Description = "Evanescence의 이탈리아 지도", 																		Size = "WORLDSIZE_TINY", 		Civs = 4, 	Minors = 8, 	TablePrefix = "Apennine" },
		[BRITISH_ISLES] = 				{ID = BRITISH_ISLES, 				File = "BritishIsles.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 그레이트 브리튼 ([COLOR_CYAN]표준[ENDCOLOR])", 		Description = "Firaxis의 영국 제도 지도",	 															Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "BritishIsles" },
		[MEDITERRANEAN] = 				{ID = MEDITERRANEAN, 				File = "Mediterranean.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 지중해 ([COLOR_CYAN]넓음[ENDCOLOR])", 			Description = "???의 지중해 지도", 																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Mediterranean" },
		[ADRIATIC] = 					{ID = ADRIATIC, 					File = "Adriatic.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 발칸 산맥 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Lungora의 아드리아 해 지도", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Adriatic" },
		[ASIA] = 						{ID = ASIA, 						File = "Asia.Civ5Map", 									Name = "[COLOR_POSITIVE_TEXT]아시아[ENDCOLOR] ([COLOR_CYAN]넓음[ENDCOLOR])", 							Description = "???의 아시아 지도", 																				Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Asia" },
		[ASIA_SMALL] = 					{ID = ASIA_SMALL, 					File = "AsiaSmall.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 동부 ([COLOR_CYAN]작음[ENDCOLOR])", 						Description = "???의 동아시아 지도", 																			Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16,	TablePrefix = "AsiaSmall" },
		[EAST_ASIA] = 					{ID = EAST_ASIA, 					File = "EastAsia.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 동남부 ([COLOR_CYAN]넓음[ENDCOLOR])", 				Description = "???의 동남아시아 지도", 																		Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "EastAsia" },
		[AUSTRALIA_SOUTHEAST_ASIA] = 	{ID = AUSTRALIA_SOUTHEAST_ASIA, 	File = "AustralasiaGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]오세아니아:[ENDCOLOR] 호주. & 동남아시아 ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 		Description = "Imperator/Elite999의 호주와 동남아시아 지도", 										Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AustralasiaGiant" },
		[NORTHEAST_ASIA] = 				{ID = NORTHEAST_ASIA, 				File = "NorthEastAsia.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 동북부 ([COLOR_CYAN]표준[ENDCOLOR])", 				Description = "Evanescence의 동북아시아 지도", 															Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "NorthEastAsia" },
		[ASIA_MONGOL_STEPPE] = 			{ID = ASIA_MONGOL_STEPPE, 			File = "AsiaSteppeGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 대초원 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Lungora의 아시아 대초원 지도", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AsiaSteppeGiant" },
		[CAUCASUS] = 					{ID = CAUCASUS, 					File = "Caucasus.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 캅카스 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Lungora의 아나톨리아와 캅카스 지도", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Caucasus" },
		[CENTRAL_ASIA] = 				{ID = CENTRAL_ASIA, 				File = "CentralAsia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 중앙부 ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 					Description = "Lungora의 중앙아시아 지도", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "CentralAsia" },
		[NORTH_ATLANTIC] = 				{ID = NORTH_ATLANTIC, 				File = "NorthAtlantic.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 대서양 ([COLOR_CYAN]넓음[ENDCOLOR])", 				Description = "???의 유럽과 동해안 지도", 													Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "NorthAtlantic" },
		[PACIFIC] = 					{ID = PACIFIC, 						File = "Pacific.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]오세아니아:[ENDCOLOR] 태평양 ([COLOR_CYAN]넓음[ENDCOLOR])", 				Description = "kevincbryan의 태평양 지도", 																Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Pacific" },
		[SOUTH_PACIFIC] = 				{ID = SOUTH_PACIFIC, 				File = "SouthPacific.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]오세아니아:[ENDCOLOR] 남부 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Firaxis의 남태평양 지도", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthPacific" },
		[INDIAN_OCEAN] = 				{ID = INDIAN_OCEAN,				 	File = "IndianOcean.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 인도양 ([COLOR_CYAN]넓음[ENDCOLOR])", 				Description = "???의 동아프리카, 인도, 동남아시아 그리고 서호주 지도", 						Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "IndianOcean" },
		[AMERICAS] = 					{ID = AMERICAS, 					File = "Americas.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]아메리카[ENDCOLOR] ([COLOR_CYAN]표준[ENDCOLOR])", 						Description = "???의 아메리카 지도", 																		Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Americas" },
		[SOUTH_AMERICA_GIANT] = 		{ID = SOUTH_AMERICA_GIANT, 			File = "SouthAmericaGiant.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR][ENDCOLOR] 남부 ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 		Description = "Imperator/Elite999의 남미 지도", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthAmericaGiant" },
		[CARIBBEAN] = 					{ID = CARIBBEAN, 					File = "Caribbean.Civ5Map",	 							Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR] 카리브해 ([COLOR_CYAN]넓음[ENDCOLOR])", 				Description = "Firaixs의 카리브해 지도", 																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Caribbean" },
		[MESOPOTAMIA_GIANT] = 			{ID = MESOPOTAMIA_GIANT, 			File = "MesopotamiaGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]중동:[ENDCOLOR] 메소포타미아 ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 			Description = "Lungora의 레반트 지도", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "MesopotamiaGiant" },
		[MESOPOTAMIA] = 				{ID = MESOPOTAMIA, 					File = "Mesopotamia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]중동:[ENDCOLOR] 메소포타미아 ([COLOR_CYAN]표준[ENDCOLOR])", 		Description = "???의 메소포타미아 지도", 																		Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Mesopotamia" },
		[LARGE_AFRICA] = 				{ID = LARGE_AFRICA, 				File = "AfricaLarge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아프리카:[ENDCOLOR] ([COLOR_CYAN]표준[ENDCOLOR])", 						Description = "jordie의 아프리카 지도", 																			Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "AfricaLarge" },
		[NILE_VALLEY] = 				{ID = NILE_VALLEY, 					File = "NileValley.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]중동:[ENDCOLOR] 나일 계곡 ([COLOR_CYAN]넓음[ENDCOLOR])", 			Description = "Admiral Ackbar의 나일 계곡 지도", 														Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "NileValley" },
		[WEST_AFRICA] = 				{ID = WEST_AFRICA, 					File = "WestAfrica.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아프리카:[ENDCOLOR] 서부 ([COLOR_CYAN]넓음[ENDCOLOR])", 					Description = "Lungora의 서아프리카 지도", 																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "WestAfrica" },
		[AMERICAS_GIANT] = 				{ID = AMERICAS_GIANT, 				File = "AmericasGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]아메리카[ENDCOLOR] ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 							Description = "Imperator/Elite999의 아메리카 지도", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AmericasGiant" },
		[INDIA_GIANT] = 				{ID = INDIA_GIANT, 					File = "IndiaGiant.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 인도 ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 						Description = "Imperator/Elite999의 남아시아 지도", 															Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "IndiaGiant" },
		[SOUTH_CENTRAL_AMERICA_HUGE] = 	{ID = SOUTH_CENTRAL_AMERICA_HUGE, 	File = "SouthAmericaCentralHuge.Civ5Map", 				Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR] 남부 & 중앙부 ([COLOR_CYAN]거대[ENDCOLOR])", 			Description = "Imperator/Elite999의 중남미 지도", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthAmericaCentralHuge" },
		[SOUTH_CENTRAL_AMERICA_GIANT] = {ID = SOUTH_CENTRAL_AMERICA_GIANT, 	File = "SouthAmericaCentralGiant.Civ5Map", 				Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR] 남부 & 중앙부 ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 		Description = "Imperator/Elite999의 중남미 지도", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthAmericaCentralGiant" },
		[SCOTLAND_IRELAND_HUGE] = 		{ID = SCOTLAND_IRELAND_HUGE, 		File = "ScotlandIrelandHuge.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 스코틀랜드 & 아일랜드 ([COLOR_CYAN]거대[ENDCOLOR])", 		Description = "Lungora의 스코틀랜드와 아일랜드 지도", 															Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "ScotlandIrelandHuge" },
		[SOUTH_AMERICA_LARGE] = 		{ID = SOUTH_AMERICA_LARGE, 			File = "SouthAmericaLarge.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR] 남부 ([COLOR_CYAN]넓음[ENDCOLOR])", 					Description = "Imperator/Elite999의 남미 지도", 														Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "SouthAmericaLarge" },
		[ASIA_SOUTH_HUGE] = 			{ID = ASIA_SOUTH_HUGE, 				File = "SouthAsiaHuge.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 남부 ([COLOR_CYAN]거대[ENDCOLOR])", 						Description = "???의 남아시아 지도", 																		Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthAsiaHuge" },
		[SOUTH_PACIFIC_GIANT] = 		{ID = SOUTH_PACIFIC_GIANT, 			File = "SouthPacificGiant.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]오세아니아:[ENDCOLOR] 남부 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Lungora의 남태평양 지도", 																Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthPacificGiant" },
		[NORTH_AMERICA_GIANT] = 		{ID = NORTH_AMERICA_GIANT, 			File = "NorthAmericaGiant.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR] 북부 ([COLOR_CYAN]훨씬 거대[ENDCOLOR])",					Description = "Imperator/Elite999의 북미 지도", 														Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "NorthAmericaGiant" },
		[NORTH_AMERICA_HUGE] = 			{ID = NORTH_AMERICA_HUGE, 			File = "NorthAmericaHuge.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR] 북부 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Lungora의 북미 지도", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "NorthAmericaHuge" },
		[TEXCOCO] = 					{ID = TEXCOCO, 						File = "Texcoco.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR] 텍스코코 호수 ([COLOR_CYAN]표준[ENDCOLOR])", 		Description = "Vanadius의 텍스코코 호수와 멕시코 계곡 지도", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Texcoco" },
		[WALES] = 						{ID = WALES, 						File = "Wales.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 웨일즈 ([COLOR_CYAN]표준[ENDCOLOR])", 				Description = "Vanadius의 웨일즈, 서부 잉글랜드, 콘월, 맨 섬, 동아일랜드 지도", 			Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Wales" },
		[SOUTHERN_AFRICA] = 			{ID = SOUTHERN_AFRICA, 				File = "SouthernAfrica.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]아프리카:[ENDCOLOR] 남부 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Vanadius의 남아프리카 대륙과 마다가스카르 지도", 									Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SouthernAfrica" },
		[SEA_OF_JAPAN] = 				{ID = SEA_OF_JAPAN, 				File = "SeaOfJapan.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 동해 ([COLOR_CYAN]거대[ENDCOLOR])", 				Description = "???의 동해 지도", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "SeaOfJapan" },
		[RUSSIA_LARGE] = 				{ID = RUSSIA_LARGE, 				File = "RussiaLarge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]지구:[ENDCOLOR] 유라시아 ([COLOR_CYAN]넓음[ENDCOLOR])", 					Description = "Eaving과 Vanadius의 캄차카에서 노르웨이까지 러시아 지도", 									Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "RussiaLarge" },
		[PATAGONIA] = 					{ID = PATAGONIA, 					File = "Patagonia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR] 파타고니아 ([COLOR_CYAN]거대[ENDCOLOR])", 				Description = "Vanadius의 아르헨티나와 칠레의 파타고니아 지도", 												Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Patagonia" },
		[NETHERLANDS] = 				{ID = NETHERLANDS, 					File = "Netherlands.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 네덜란드 ([COLOR_CYAN]표준[ENDCOLOR])", 			Description = "Vanadius의 북부 벨기에와 북서부 독일을 포함한 네덜란드 지도", 			Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Netherlands" },
		[INDONESIA] = 					{ID = INDONESIA, 					File = "Indonesia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 인도네시아 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Vanadius의 동남아시아와 필리핀을 포함한 인도네시아 군도 지도", 	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Indonesia" },
		[MEDITERRANEAN_HUGE] = 			{ID = MEDITERRANEAN_HUGE, 			File = "MediterraneanHuge.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 지중해 ([COLOR_CYAN]거대[ENDCOLOR])", 			Description = "DMS의 지중해 지도", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "MediterraneanHuge" },
		[CENTRAL_AFRICA_LARGE] = 		{ID = CENTRAL_AFRICA_LARGE, 		File = "CentralAfricaLarge.Civ5Map", 					Name = "[COLOR_POSITIVE_TEXT]아프리카:[ENDCOLOR] 중앙부 ([COLOR_CYAN]넓음[ENDCOLOR])", 					Description = "Vanadius의 케냐에서 앙골라, 나이지리아까지 중앙 아프리카 지도", 							Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "CentralAfricaLarge" },
		[GERMANY_HUGE] = 				{ID = GERMANY_HUGE, 				File = "GermanyHuge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 독일 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Vanadius의 독일 지도", 																		Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "GermanyHuge" },
		[CARIBBEAN_HUGE] = 				{ID = CARIBBEAN_HUGE, 				File = "CaribbeanHuge.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]아메리카:[ENDCOLOR] 카리브해 ([COLOR_CYAN]거대[ENDCOLOR])", 				Description = "Lungora의 카리브해 지도", 																	Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "CaribbeanHuge" },
		[EARTH_MK3] = 					{ID = EARTH_MK3, 					File = "EarthMk3.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]지구:[ENDCOLOR] Mk.3 ([COLOR_CYAN]거대[ENDCOLOR])", 						Description = "배틀 로얄을 위한 지구 지도", 															Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "EarthMk3" },
		[VIETNAM] = 					{ID = VIETNAM, 						File = "Vietnam.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 베트남 ([COLOR_CYAN]작음[ENDCOLOR])", 					Description = "Lungora의 베트남, 캄보디아, 라오스, 중국 및 태국 일부 지역의 지도", 						Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16,	TablePrefix = "Vietnam" },
		[JAPAN_HUGE] = 					{ID = JAPAN_HUGE, 					File = "JapanHuge.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 대한민국 ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 						Description = "Lungora의 대한민국과 일본의 지도", 															Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "JapanHuge" },
		[LEVANT] = 						{ID = LEVANT, 						File = "Levant.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]중동:[ENDCOLOR] 레반트 ([COLOR_CYAN]표준[ENDCOLOR])", 				Description = "Lungora의 레반트, 키프로스, 나일 삼각주, 시나이 반도 지도", 									Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Levant" },
		[AUSTRALIA] = 					{ID = AUSTRALIA, 					File = "Australia.Civ5Map", 							Name = "[COLOR_POSITIVE_TEXT]오세아니아:[ENDCOLOR] 호주 ([COLOR_CYAN]표준[ENDCOLOR])", 			Description = "Lungora의 호주 지도", 																		Size = "WORLDSIZE_STANDARD", 	Civs = 16, 	Minors = 32, 	TablePrefix = "Australia" },
		[IBERIA] = 						{ID = IBERIA, 						File = "Iberia.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 이베리아 ([COLOR_CYAN]넓음[ENDCOLOR])", 					Description = "Lungora의 이베리아 반도, 모로코, 서부 알제리 및 남부 프랑스의 일부 지도", 				Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "Iberia" },
		[INDIA] = 						{ID = INDIA, 						File = "India.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 인도 ([COLOR_CYAN]넓음[ENDCOLOR])", 						Description = "Lungora의 남아시아 지도", 																	Size = "WORLDSIZE_LARGE", 		Civs = 8, 	Minors = 16, 	TablePrefix = "India" },
		[ATLANTIC_GIANT] = 				{ID = ATLANTIC_GIANT, 				File = "AtlanticGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 대서양 ([COLOR_CYAN]거대[ENDCOLOR])", 					Description = "Vanadius의 하와이에서 노르웨이까지 대서양 지도", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "AtlanticGiant" },
		[NORTH_SEA_GIANT] = 			{ID = NORTH_SEA_GIANT, 				File = "NorthSeaGiant.Civ5Map", 						Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 북해 ([COLOR_CYAN]훨씬 거대[ENDCOLOR])", 				Description = "Vanadius의 노르웨이해, 바렌츠해, 그린란드해 그리고 북대서양 지도", 		Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "NorthSeaGiant" },
		[DENMARK] = 					{ID = DENMARK, 						File = "Denmark.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]유럽:[ENDCOLOR] 덴마크 ([COLOR_CYAN]작음[ENDCOLOR])", 					Description = "Jules Winnfield의 덴마크 지도", 																Size = "WORLDSIZE_SMALL", 		Civs = 6, 	Minors = 16, 	TablePrefix = "Denmark" },
		[ORIENT] = 						{ID = ORIENT, 						File = "Orient.Civ5Map", 								Name = "[COLOR_POSITIVE_TEXT]아시아:[ENDCOLOR] 동양 ([COLOR_CYAN]거대[ENDCOLOR])", 						Description = "Napoleon V의 아프리카에서 인도까지 동양 지도", 											Size = "WORLDSIZE_HUGE", 		Civs = 12, 	Minors = 24, 	TablePrefix = "Orient" },

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
	[LARGE_EUROPE] = { TXT_KEY_FEATURE_VOLCANO = "산토리니", TXT_KEY_FEATURE_REEF = "술라레베트", TXT_KEY_FEATURE_GEYSER = "그레이트 게이시르", TXT_KEY_FEATURE_CRATER = "틴 바이더 크레이터", TXT_KEY_FEATURE_POTOSI = "그레이트 코퍼 마운틴" },
	[LARGE_GREATEST_EARTH] = {},
	[GIANT_EUROPE] = { 
		TXT_KEY_FEATURE_VOLCANO = "산토리니",
		TXT_KEY_CIV5_FEATURES_KRAKATOA_TEXT = "산토리니는 에게해 남쪽에 위치한 섬입니다. 이 섬은 기록된 역사상 가장 큰 화산 폭발 중 하나가 일어난 곳입니다. 미노아 분화, 때로는 테라 분화라고도 불리는 이 분화는 약 3,600년 전 미노아 문명의 절정기에 일어났습니다. 이 분화로 인해 수백 피트 깊이의 화산재 퇴적물로 둘러싸인 거대한 칼데라가 생겼고, 거대한 쓰나미를 통해 남쪽으로 110km 떨어진 크레타 섬의 미노아 문명이 간접적으로 붕괴되었을 가능성이 있습니다. 또 다른 인기 있는 이론은 테라 화산 폭발이 아틀란티스 전설의 근원이라는 주장입니다.",		
		TXT_KEY_FEATURE_REEF = "술라레베트",
		TXT_KEY_CIV5_FEATURES_GREATBARRIERREEF_TEXT = "술라레베트(술라 리프)는 노르웨이 해안의 심해 산호초입니다. 이 섬은 술라 섬의 이름을 딴 술라 릿지에 위치해 있습니다. 이 산호초는 냉수 산호종(로너리아 페르투사, Lophelia pertusa)에 의해 생성됩니다. 길이는 약 13km이고, 너비는 700m입니다. 산호초의 두께는 최대 35m에 이릅니다. 2002년 랏 암초가 발견되기 전까지, 술라 암초는 세계에서 가장 큰 로너리아 암초로 알려져 있었습니다.",
		TXT_KEY_FEATURE_GEYSER = "그레이트 게이시르",
		TXT_KEY_CIV5_FEATURES_OLDFAITHFUL_TEXT = "게이시르는 때때로 그레이트 게이시르라고도 불리며, 아이슬란드 남서부에 있는 간헐천입니다. 이것은 인쇄된 자료에 기술된 최초의 간헐천이며, 현대 유럽인에게 알려진 최초의 간헐천이기도 합니다. 영어 단어 geyser(주기적으로 솟구치는 온천)는 게이시르(Geysir)에서 유래되었습니다. 게이시르라는 이름 자체는 아이슬란드어 동사 게이사(geysa)에서 유래되었습니다. 게이시르는 라우가르피얄 언덕의 경사면에 있는 하우카달루르 계곡에 위치하고 있으며, 약 50m 남쪽에 스트로쿠르 간헐천이 있습니다.",
		TXT_KEY_FEATURE_CRATER = "틴 바이더 크레이터",
		TXT_KEY_CIV5_FEATURES_BARRINGER_TEXT = "틴 바이더는 알제리의 건조하고 험준한 지형에 위치한 충돌 분화구입니다. 이 분화구는 지난 7천만 년 동안, 아마도 백악기 후기나 제3기 초기에 형성되었습니다. 6km에 달하는 이 분화구는 여러 언덕의 남쪽 끝에 위치해 있습니다. 틴 바이더의 높은 위치와 동심원 고리는 그 구조가 복잡하다는 것을 암시합니다.",
		TXT_KEY_FEATURE_POTOSI = "그레이트 코퍼 마운틴",
		TXT_KEY_CIV5_FEATURES_POTOSI_TEXT =  "팔룬 광산은 스웨덴 팔룬에 있는 광산으로, 10세기부터 1992년까지 천 년 동안 운영되었습니다.스웨덴은 유럽의 구리 수요의 3분의 2를 생산했고, 17세기에 스웨덴이 치른 여러 전쟁에 자금을 지원했습니다. 이 광산의 기술 개발은 2세기 동안 전 세계 광업에 큰 영향을 미쳤습니다. 2001년부터 유네스코 세계문화유산으로 지정되었으며 박물관으로도 활용되고 있습니다.",
		TXT_KEY_FEATURE_MT_FUJI = "에트나 산",
		TXT_KEY_CIV5_FEATURES_FUJI_TEXT = "에트나 산은 이탈리아 시칠리아 동부 해안, 카타니아 도, 메시나와 카타니아 사이에 있는 활화산입니다. 이 지역은 아프리카판과 유라시아판 사이의 수렴판 경계 위에 위치해 있습니다. 유럽 대륙에서 가장 높은 활화산으로, 현재 높이는 3,329m(10,922피트)이지만 정상 분화에 따라 달라집니다.",
		TXT_KEY_FEATURE_MT_KAILASH = "몽블랑",
		TXT_KEY_CIV5_FEATURES_MT_KAILASH_TEXT = "몽블랑은 알프스, 서유럽, 유럽연합에서 가장 높은 산입니다. 이 산은 이탈리아의 발레다오스타 주와 프랑스의 오트사부아 지방 사이에 위치해 있습니다. 해발 4,810m로, 지형적 중요성 면에서 세계 11위를 차지했습니다. 몽블랑 정상은 두께가 일정하지 않고 계속 변하는 두꺼운 얼음과 눈으로 된 돔 형태로, 정확한 측정은 이루어졌지만 정상의 정확하고 영구적인 고도를 결정할 수는 없습니다. 이 산은 1786년 미셸 가브리엘 파카르와 자크 발마가 처음으로 등반했습니다. 1886년, 미래에 미국 대통령이 되는 시어도어 루스벨트가 정상으로 탐험을 이끌었습니다. 오늘날 이곳은 세계에서 가장 많이 방문하는 관광지 중 하나입니다.",
		TXT_KEY_FEATURE_MESA = "실리고 메사",
		TXT_KEY_CIV5_FEATURES_GRANDMESA_TEXT = "실리고는 이탈리아 사르데냐 북부, 로구도로 지방에 있는 도시입니다. 몬테 산투라고도 알려져 있으며 지각 활동으로 인해 수평으로 층을 이룬 암석이 풍화되고 침식되어 평평한 꼭대기가 형성된 높은 지대입니다. 이곳에는 고고학 유적지와 선사시대 누라게 성지가 있습니다.",
		TXT_KEY_FEATURE_SRI_PADA = "키르큐펠",
		TXT_KEY_CIV5_FEATURES_SRI_PADA_TEXT = "키르큐펠(아이슬란드어: 교회 산)은 아이슬란드의 스나이펠스네스 반도 북쪽 해안, 그룬다르피요르드 마을 근처에 있는 높이 463m의 산입니다.",
		TXT_KEY_FEATURE_LAKE_VICTORIA = "라도가 호수",
		TXT_KEY_CIV5_FEATURES_LAKE_VICTORIA_TEXT = "라도가 호수는 러시아 북서부, 카렐리야 공화국과 레닌그라드 주에 위치한 담수호로, 상트페테르부르크 외곽에 있습니다. 유럽에서 가장 큰 호수이며, 면적 기준으로 세계에서 15번째로 큰 담수호입니다.",
		TXT_KEY_FEATURE_KILIMANJARO = "옐브루스 산",
		TXT_KEY_CIV5_FEATURES_KILIMANJARO_TEXT = "엘브루스 산은 러시아의 카바르디노발카리야 공화국과 카라차예보체르케시야 공화국에 걸쳐 있는 캅카스 산맥 서부에 위치한 휴화산으로, 조지아 국경과 가깝습니다. 엘브루스 산의 봉우리는 캅카스 산맥과 유럽에서 가장 높은 봉우리입니다."
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
			{ Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 문명만 게임에 참여할 수 있습니다.", Value = MAJOR_TSL_ONLY,},
			{ Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 문명은 무작위로 배치됩니다.", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "완전히 무작위", ToolTip = "모든 문명은 무작위로 배치됩니다.", Value = MAJOR_ALL_RANDOM,},
		}
		
	MinorPlacementValues = { 
			{ Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 도시 국가만 게임에 참여할 수 있습니다.", Value = MINOR_TSL_ONLY,},
			{ Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 도시 국가는 무작위로 배치됩니다.", Value = MINOR_TSL_RANDOM,},
			{ Name	= "완전히 무작위", ToolTip = "모든 도시 국가는 무작위로 배치됩니다.", Value = MINOR_ALL_RANDOM,},
		}

elseif ( g_madeiraCS == 1 ) then
	MinorPlacementValues = { 
			{ Name	= "오직 TSL만", ToolTip = "마데이라의 선택과 실제 시작 위치(True Starting Location)", Value = MINOR_TSL_ONLY,},
			{ Name	= "무작위", ToolTip = "마데이라의 선택과 무작위 배치", Value = MINOR_ALL_RANDOM,},
		}
elseif ( g_dynamicCS == 1 ) then
	MinorPlacementValues = { 
			{ Name	= "동적 배치", ToolTip = "동적 역사 모드가 활성화되었습니다.", Value = MINOR_TSL_ONLY,},
		}
else
	MajorPlacementValues = { 
			{ Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 문명만 게임에 참여할 수 있습니다.", Value = MAJOR_TSL_ONLY,},
			{ Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 문명은 무작위로 배치됩니다.", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "완전히 무작위", ToolTip = "모든 문명은 무작위로 배치됩니다.", Value = MAJOR_ALL_RANDOM,},
		}
		
	MinorPlacementValues = { 
			{ Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 도시 국가만 게임에 참여할 수 있습니다.", Value = MINOR_TSL_ONLY,},
			{ Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 도시 국가는 무작위로 배치됩니다.", Value = MINOR_TSL_RANDOM,},
			{ Name	= "완전히 무작위", ToolTip = "모든 도시 국가는 무작위로 배치됩니다.", Value = MINOR_ALL_RANDOM,},
		}
end

if ( g_dynamicCS == 1 ) then
	NoUSOption = 	{
		ID = NO_US,
		Name = "문명의 지연된 시작",
		ToolTip = "동적 역사 모드가 선택되어 있으면 문명이 실제 날짜로 시작됩니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		Checked = true,
		SortPriority = 3,
	}
else
	NoUSOption = 	{
		ID = NO_US,
		Name = "오직 아메리카 원주민만",
		ToolTip = "게임 시작 시 식민지 문명(예: 미국 및 브라질)이 선택되어 있으면 제거되고, 원주민 문명만 유지됩니다.",
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
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip = "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[HUGE_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 문명만 게임에 참여할 수 있습니다.", Value = MAJOR_TSL_ONLY,},
			{ Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 문명은 무작위로 배치됩니다.", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "완전히 무작위", ToolTip = "모든 문명은 무작위로 배치됩니다.", Value = MAJOR_ALL_RANDOM,},
		},
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 도시 국가만 게임에 참여할 수 있습니다.", Value = MINOR_TSL_ONLY,},
			{ Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 도시 국가는 무작위로 배치됩니다.", Value = MINOR_TSL_RANDOM,},
			{ Name	= "완전히 무작위", ToolTip = "모든 도시 국가는 무작위로 배치됩니다.", Value = MINOR_ALL_RANDOM,},
		},
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip = "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LARGE_GREATEST_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip = "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},---------------
-- [STANDARD_EARTH] = {
	-- [MAJOR_PLACEMENT] = {
		-- ID = MAJOR_PLACEMENT,
		-- Name = "문명 배치",
		-- ToolTip = "주요 문명의 배치",
		-- Disabled = false,
		-- DefaultValue = 1,
		-- SortPriority = 2,
		-- Values = { 
			-- { Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 문명만 게임에 참여할 수 있습니다.", Value = MAJOR_TSL_ONLY,},
			-- { Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 문명은 무작위로 배치됩니다.", Value = MAJOR_TSL_RANDOM,},
			-- { Name	= "완전히 무작위", ToolTip = "모든 문명은 무작위로 배치됩니다.", Value = MAJOR_ALL_RANDOM,},
		-- },
	-- },
	-- [MINOR_PLACEMENT] = {
		-- ID = MINOR_PLACEMENT,
		-- Name = "도시 국가 배치",
		-- ToolTip = "도시 국가에 대한 배치",
		-- Disabled = false,
		-- DefaultValue = 1,
		-- SortPriority = 2,
		-- Values = { 
			-- { Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 도시 국가만 게임에 참여할 수 있습니다.", Value = MINOR_TSL_ONLY,},
			-- { Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 도시 국가는 무작위로 배치됩니다.", Value = MINOR_TSL_RANDOM,},
			-- { Name	= "완전히 무작위", ToolTip = "모든 도시 국가는 무작위로 배치됩니다.", Value = MINOR_ALL_RANDOM,},
		-- },
	-- },
	-- [MINOR_DISTANCE] = {
			-- ID = MINOR_DISTANCE,
			-- Name = "도시 국가 분리",
			-- ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			-- Disabled = false,
			-- DefaultValue = 3,
			-- SortPriority = 2,
			-- Values = { 
				-- { Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				-- { Name	= "최소", ToolTip = "3 타일", Value = MINOR_DISTANCE_MINI,},
				-- { Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				-- { Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				-- { Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			-- },
	-- },
	-- [RESOURCE_QUANTITY] = {
			-- ID = RESOURCE_QUANTITY,
			-- Name = "자원",
			-- ToolTip = "자원 양",
			-- Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	-- },
-- },
---------------
[STANDARD_CORDIFORM_EARTH] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 문명만 게임에 참여할 수 있습니다.", Value = MAJOR_TSL_ONLY,},
			{ Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 문명은 무작위로 배치됩니다.", Value = MAJOR_TSL_RANDOM,},
			{ Name	= "완전히 무작위", ToolTip = "모든 문명은 무작위로 배치됩니다.", Value = MAJOR_ALL_RANDOM,},
		},
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = { 
			{ Name	= "오직 TSL만", ToolTip = "실제 시작 위치(True Starting Location)가 있는 도시 국가만 게임에 참여할 수 있습니다.", Value = MINOR_TSL_ONLY,},
			{ Name	= "무작위 그리고 TSL", ToolTip = "실제 시작 위치(True Starting Location)가 없는 도시 국가는 무작위로 배치됩니다.", Value = MINOR_TSL_RANDOM,},
			{ Name	= "완전히 무작위", ToolTip = "모든 도시 국가는 무작위로 배치됩니다.", Value = MINOR_ALL_RANDOM,},
		},
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip = "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[AFRICA_ASIA_OCEANIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip = "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AMERICAS_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AMERICAS] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[NORTH_ATLANTIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[PACIFIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[SOUTH_PACIFIC_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_PACIFIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[INDIAN_OCEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[GIANT_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[LARGE_EUROPE_NEW] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LARGE_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------- 
[SOUTH_CENTRAL_AMERICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_CENTRAL_AMERICA_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_AMERICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTH_AMERICA_LARGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTH_AMERICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTH_AMERICA_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AFRICA_SOUTH_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AFRICA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LARGE_AFRICA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[AUSTRALIA_SOUTHEAST_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[ASIA_SOUTH_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[EAST_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ASIA_SMALL] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTHEAST_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ASIA_MONGOL_STEPPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CENTRAL_ASIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[INDIA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CAUCASUS] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MESOPOTAMIA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MESOPOTAMIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[NILE_VALLEY] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[WEST_AFRICA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MEDITERRANEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[APENNINE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[AEGEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[ADRIATIC] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[BRITISH_ISLES] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[EASTERN_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTHWEST_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
---------------
[NORTH_SEA_EUROPE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SCOTLAND_IRELAND_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CARIBBEAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[TEXCOCO] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[WALES] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SOUTHERN_AFRICA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[SEA_OF_JAPAN] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[RUSSIA_LARGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[PATAGONIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NETHERLANDS] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[INDONESIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[MEDITERRANEAN_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CENTRAL_AFRICA_LARGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[GERMANY_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[CARIBBEAN_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[VIETNAM] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[JAPAN_HUGE] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[LEVANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[AUSTRALIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[IBERIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[INDIA] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[EARTH_MK3] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[ATLANTIC_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[NORTH_SEA_GIANT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[DENMARK] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
			},
	},
},
----------------
[ORIENT] = {
	[MAJOR_PLACEMENT] = {
		ID = MAJOR_PLACEMENT,
		Name = "문명 배치",
		ToolTip = "주요 문명의 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MajorPlacementValues -- mod dependancy for these values, see the MOD Dependancy section above
	},
	[MINOR_PLACEMENT] = {
		ID = MINOR_PLACEMENT,
		Name = "도시 국가 배치",
		ToolTip = "도시 국가에 대한 배치",
		Disabled = false,
		DefaultValue = 1,
		SortPriority = 2,
		Values = MinorPlacementValues -- mod dependency for these values, see the MOD Dependency section above
	},
	[MINOR_DISTANCE] = {
			ID = MINOR_DISTANCE,
			Name = "도시 국가 분리",
			ToolTip = "도시 국가 최소 분리 거리: 최소 거리 내에서 시작하는 도시는 게임에서 제거됩니다.",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 2,
			Values = { 
				{ Name	= "선택 안 함", ToolTip = "도시 국가의 시작 위치가 겹치도록 허용합니다. 권장하지 않음.", Value = MINOR_DISTANCE_NO,},
				{ Name	= "최소", ToolTip =  "3 타일", Value = MINOR_DISTANCE_MINI,},
				{ Name	= "근접", ToolTip = "~ 5 타일", Value = MINOR_DISTANCE_CLOSE,},
				{ Name	= "중간", ToolTip = "~ 7 타일", Value = MINOR_DISTANCE_MEDIUM,},
				{ Name	= "멀리", ToolTip = "~ 9 타일", Value = MINOR_DISTANCE_AWAY,},
			},
	},
	[RESOURCE_QUANTITY] = {
			ID = RESOURCE_QUANTITY,
			Name = "자원",
			ToolTip = "자원 양",
			Disabled = false,
			DefaultValue = 3,
			SortPriority = 3,
			Values = { 
				{ Name	= "가난", ToolTip = "매우 드문 자원", Value = RESOURCE_POOR,},
				{ Name	= "부족", ToolTip = "적은 자원", Value = RESOURCE_SPARSE,},
				{ Name	= "표준", ToolTip = "표준 값", Value = RESOURCE_STANDARD,},
				{ Name	= "풍족", ToolTip = "더 많은 자원", Value = RESOURCE_ABUNDANT,},
				{ Name	= "부유", ToolTip = "내가 말했지. 더 많은 자원을 내놔 !!!", Value = RESOURCE_RICHE,},
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
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "전략적 자원 매장량",
		ToolTip = "지정된 지역에 육중한 매장량의 자원을 놓습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[HUGE_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "전략적 자원 매장량",
		ToolTip = "지정된 지역에 육중한 매장량의 자원을 놓습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
-- [STANDARD_EARTH] = {
	-- {
		-- ID = NO_US,
		-- Name = "오직 아메리카 원주민만",
		-- ToolTip = "게임 시작 시 식민지 문명(예: 미국 및 브라질)이 선택되어 있으면 제거되고, 원주민 문명만 유지됩니다.",
		-- Disabled = false,
		-- GameOption = false, MapOption = true,
		-- SortPriority = 0,
	-- },	{
		-- ID = RESOURCE_SCALE,
		-- Name = "자원 조정 없음",
		-- ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		-- Disabled = false,
		-- GameOption = false, MapOption = true,
		-- SortPriority = 2,
	-- },	{
		-- ID = RESOURCE_REQUESTED,
		-- Name = "역사적 시작 자원",
		-- ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		-- Disabled = false,
		-- GameOption = false, MapOption = true,
		-- SortPriority = 2,
	-- },
-- },
----------------
[STANDARD_CORDIFORM_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
---------------- 
[LARGE_EUROPE] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
---------------- 
[LARGE_GREATEST_EARTH] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},		{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
---------------- 
[GIANT_EUROPE] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[APENNINE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[EAST_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[BRITISH_ISLES] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTHEAST_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AEGEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTH_ATLANTIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[PACIFIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_PACIFIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTHWEST_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[CARIBBEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[MEDITERRANEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[MESOPOTAMIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[LARGE_AFRICA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NILE_VALLEY] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AMERICAS] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[MESOPOTAMIA_GIANT] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},		{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
}, 
----------------
[ASIA_SMALL] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[LARGE_EUROPE_NEW] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[ADRIATIC] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[WEST_AFRICA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[CAUCASUS] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[ASIA_MONGOL_STEPPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[CENTRAL_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[EASTERN_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTH_SEA_EUROPE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AFRICA_ASIA_OCEANIA] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AFRICA_SOUTH_EUROPE] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AFRICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_AMERICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AUSTRALIA_SOUTHEAST_ASIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[INDIAN_OCEAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[AMERICAS_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[INDIA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_CENTRAL_AMERICA_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_CENTRAL_AMERICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SCOTLAND_IRELAND_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_AMERICA_LARGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[ASIA_SOUTH_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTH_PACIFIC_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTH_AMERICA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[NORTH_AMERICA_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[TEXCOCO] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[WALES] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SOUTHERN_AFRICA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[SEA_OF_JAPAN] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
[RUSSIA_LARGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[PATAGONIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[NETHERLANDS] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[INDONESIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[MEDITERRANEAN_HUGE] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[CENTRAL_AFRICA_LARGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[GERMANY_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[CARIBBEAN_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[VIETNAM] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[JAPAN_HUGE] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[LEVANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[AUSTRALIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[IBERIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[INDIA] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[NORTH_SEA_GIANT] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[DENMARK] = {
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[ORIENT] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	
	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[EARTH_MK3] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "전략적 자원 매장량",
		ToolTip = "지정된 지역에 육중한 매장량의 자원을 놓습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
-----------
[ATLANTIC_GIANT] = {
	{
		ID = BOSPHORUS,
		Name = "보스포루스 해협",
		ToolTip = "체크하면 보스포루스 해협에 바다 타일을 사용하고, 체크하지 않으면 강을 사용합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 0,
	},	{
		ID = RESOURCE_GEO,
		Name = "진실된 자원 배치",
		ToolTip = "자원을 올바른 지리적 지역에 배치하도록 강제합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_DEPOSIT,
		Name = "전략적 자원 매장량",
		ToolTip = "지정된 지역에 육중한 매장량의 자원을 놓습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 1,
	},	{
		ID = RESOURCE_SCALE,
		Name = "자원 조정 없음",
		ToolTip = "플레이어 수에 따라 자원 양이 조정되지 않습니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},	{
		ID = RESOURCE_REQUESTED,
		Name = "역사적 시작 자원",
		ToolTip = "각 문명에 역사적으로 맞는 자원을 배치합니다.",
		Disabled = false,
		GameOption = false, MapOption = true,
		SortPriority = 2,
	},
},
----------------
}

--print ("---- YnAEMP defines loaded -----")