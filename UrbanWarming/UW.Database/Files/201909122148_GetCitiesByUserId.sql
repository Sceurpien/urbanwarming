SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetCitiesByUserId]
(
	@UserId nvarchar(100)
)
AS
BEGIN
  SELECT 
	c.Id, c.Name, c.Level,
	ct.Id as CityTypeid, ct.Description, ct.Difficulty, ct.FictionalName, ct.OfficialName, ct.Name as CityTypeName, ct.Region, ct.RoadConnection, ct.SeaConnection,
	l.Id as LocationId, l.Longitude, l.Lattitude
  FROM [dbo].[CityToUser] t
  LEFT JOIN [dbo].[City] c on t.CityId = c.Id
  LEFT JOIN [dbo].[CityType] ct on c.CityTypeId = ct.Id
  LEFT JOIN [dbo].[Location] l on c.LocationId = l.Id
  WHERE UserId = @UserId
END
