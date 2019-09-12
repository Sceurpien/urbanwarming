SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetCityByUserId]
(
	@UserId nvarchar(100)
)
AS
BEGIN
	SELECT TOP 1
	c.Id, c.Name, c.Level, 
	l.Id as LocationId, l.Longitude, l.Lattitude,
	ct.Id as CityTypeid, ct.Description, ct.Difficulty, ct.FictionalName, ct.OfficialName, ct.Name as CityTypeName, ct.Region, ct.RoadConnection, ct.SeaConnection
	FROM CityToUser u
	LEFT JOIN dbo.City c on u.CityId = c.Id
	LEFT JOIN dbo.CityType ct on c.CityTypeId = ct.Id
	LEFT JOIN dbo.Location l on c.LocationId = l.Id
	WHERE u.UserId = @UserId AND u.Owner = 1
END
GO