INSERT INTO ArtDefine_LandmarkTypes
			(Type, 						LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_RESOURCE_SEALS', 	'Resource', 	'INUIT_SEALS');

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_RESOURCE_SEALS', 	'Resource', 	'sv_Seals.dds');

INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 			Scale, 	ImprovementType, 						LayoutHandler, 	ResourceType, 				Model, 				TerrainContour)
VALUES 	('Any', 'Constructed', 	0.50,  	'ART_DEF_IMPROVEMENT_FISHING_BOATS', 	'ANIMATED', 	'ART_DEF_RESOURCE_SEALS', 	'seals.fxsxml', 	1),
		('Any', 'Pillaged', 	0.50,  	'ART_DEF_IMPROVEMENT_FISHING_BOATS', 	'ANIMATED', 	'ART_DEF_RESOURCE_SEALS', 	'seals_pl.fxsxml', 	1);
		
