SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Population](
[Id] [int] IDENTITY NOT NULL,
[CityId] [int] NOT NULL,
[CityMapId] [int] NULL,
[All] [int] NOT NULL DEFAULT 0,
[AllIncrease] [int] NOT NULL DEFAULT 0,
[Young] [int] NOT NULL DEFAULT 0,
[YoungIncrease] [int] NOT NULL DEFAULT 0,
[YoungAdult] [int] NOT NULL DEFAULT 0,
[YoungAdultIncrease] [int] NOT NULL DEFAULT 0,
[Adult] [int] NOT NULL DEFAULT 0,
[AdultIncrease] [int] NOT NULL DEFAULT 0,
[Elder] [int] NOT NULL DEFAULT 0,
[ElderIncrease] [int] NOT NULL DEFAULT 0
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE PROCEDURE [dbo].[sp_GetCityPopulation]
(
	@CityId nvarchar(100)
)
AS
BEGIN
  SELECT 
	p.CityId, p.CityMapId,
	p.[All], p.AllIncrease, p.Young, p.YoungIncrease, p.YoungAdult, p.YoungAdultIncrease,
	p.Adult, p.AdultIncrease, p.Elder, p.ElderIncrease
  FROM [dbo].[Population] p
  WHERE p.CityId = @CityId AND p.CityMapId = NULL
END
GO