SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetCityTypes]
AS 
BEGIN
	SELECT Id, Name, OfficialName, FictionalName, Region, SeaConnection, RoadConnection, Difficulty, Description
	FROM dbo.[CityType]
END
GO