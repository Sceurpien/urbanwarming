SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetCityMap]
(
	@CityId int
)
AS
BEGIN 
  SELECT 
	map.Id, map.Name, map.Level, map.XCoordinate, map.YCoordinate,
	maptype.Id as CityMapTypeId, maptype.Name as CityMapTypeName, maptype.OfficialName as CityMapTypeOfficialName, maptype.FictionalName as CityMapTypeFictionalName,
	mapzone.Id as CityMapZoneId, mapzone.Name as CityMapZoneName, mapzone.OfficialName as CityMapZoneOfficialName, mapzone.FictionalName as CityMapZoneFictionalName,
	mt.Id as ZoneMapTypeId, mt.Name as ZoneMapTypeName, mt.OfficialName as ZoneMapTypeOfficialName, mt.FictionalName as ZoneMapTypeFictionaleName
  FROM [dbo].[CityMap] map
  LEFT JOIN [dbo].[CityMapType] maptype on map.CityMapTypeId = maptype.Id
  LEFT JOIN [dbo].[CityMapZone] mapzone on map.CityMapZoneId = mapzone.Id
  LEFT JOIN [dbo].[CityMapType] mt on mapzone.CityMapTypeId = mt.Id
  WHERE map.CityId = @CityId
END
GO