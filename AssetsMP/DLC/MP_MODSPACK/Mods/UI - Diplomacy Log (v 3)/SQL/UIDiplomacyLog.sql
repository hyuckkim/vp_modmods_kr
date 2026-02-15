INSERT INTO Diplomacy_StfuResponses(ResponseType, StfuType)
  SELECT Type, 'STFU_EVENT' FROM Responses;
