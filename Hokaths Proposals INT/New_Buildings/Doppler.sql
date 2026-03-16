--------
-- text 
--------
UPDATE Language_ko_KR SET
Text = Replace(Text, ', +15 [ICON_STRENGTH] Damage to Air Units during Air Strikes on City.', '.')
WHERE Tag = 'TXT_KEY_BUILDING_MILITARY_BASE_HELP';

INSERT INTO Language_ko_KR
	(Tag, Text)
VALUES
	('TXT_KEY_PROMOTION_DOPPLER', 'Early Warning'),	
	('TXT_KEY_PROMOTION_DOPPLER_HELP', '+2 [ICON_VISION] Vision.[NEWLINE]+20% [ICON_STRENGTH] Strength in [COLOR_POSITIVE_TEXT]Friendly Territory[ENDCOLOR].'),	

	('TXT_KEY_BUILDING_DOPPLER_STATION', 'Doppler Station'),	
	('TXT_KEY_BUILDING_DOPPLER_STATION_HELP', ''),
-- All new Air Units created in the Empire receive +2 XP, and all Air Units created in this City receive the [COLOR_POSITIVE_TEXT]Early Warning[ENDCOLOR] Promotion. +15 [ICON_STRENGTH] Damage to Air Units during Air Raids on this City.[NEWLINE][NEWLINE]+1 [ICON_RESEARCH] Science from all Sea Tiles worked by this City. +1 [ICON_FOOD] and [ICON_PRODUCTION] Production from nearby Farms. +3 [ICON_FOOD] Food and [ICON_PRODUCTION] Production for every 2 Mountains within the workable tiles.
	('TXT_KEY_BUILDING_DOPPLER_STATION_STRATEGY', 'Predicting the weather means your crops will do better, and your Mountains less prone to natural disaster, which is all good news for local yields. The real strength of having a national radar infrastructure though is in air power. All Aircraft created are stronger, and more so for every station in your network, and enemy Aircraft take high damage trying to attack a City protected by radar.'),
	('TXT_KEY_CIV5_BUILDINGS_DOPPLER_STATION_TEXT', 'A "Doppler station" typically refers to a weather radar station that uses the Doppler effect to measure the speed and direction of precipitation and wind. By bouncing microwave signals off objects like rain, it analyzes the frequency shift of the returning signal to determine if the target is moving towards or away from the station, providing crucial data for storm tracking and forecasting. This technology is vital for weather services and can also be found in other applications, such as police speed guns and medical ultrasound.[NEWLINE][NEWLINE]At the outbreak of war in September 1939, both the United Kingdom and Germany had functioning radar systems. By the time of the Battle of Britain in mid-1940, the Royal Air Force (RAF) had fully integrated RDF as part of the national air defence, and was critical in enabling the RAF to defeat the much larger Luftwaffe forces. In the summer of 1940, the British Tizard Mission visited the United States, demonstrating the new cavity magnetron to Americans scientists. This radio source was over 100 times more powerful than previous devices, enabling detection of aircraft at ranges up to 100 miles, and ships at 30 miles.');