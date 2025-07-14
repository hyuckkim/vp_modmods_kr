INSERT INTO Audio_Sounds
	(SoundID, FileName, LoadType, DontCache)
VALUES
	('SND_ELEPHANT_TRUMPETING', 'ELEPHANT_TRUMPETING', 'Streamed', 1);

INSERT INTO Audio_2DSounds
	(ScriptID, SoundID, SoundType, TaperSoundtrackVolume)
VALUES
	('AS2D_ELEPHANT_TRUMPETING', 'SND_ELEPHANT_TRUMPETING', 'GAME_SFX', '0.0');