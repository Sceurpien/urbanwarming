SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tourism](
[Id] [int] IDENTITY NOT NULL,
[CityId] [int] NOT NULL,
[CityMapId] [int] NULL,
[Landmark] [int] NOT NULL DEFAULT 0,
[Party] [int] NOT NULL DEFAULT 0,
[Leisure] [int] NOT NULL DEFAULT 0,
[Event] [int] NOT NULL DEFAULT 0,
[Business] [int] NOT NULL DEFAULT 0
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE PROCEDURE [dbo].[sp_GetCityTourism]
(
	@CityId nvarchar(100)
)
AS
BEGIN
  SELECT 
	t.CityId, t.CityMapId,
	t.Landmark, t.Party, t.Leisure, t.Event, t.Business
  FROM [dbo].[Tourism] t
  WHERE t.CityId = @CityId AND t.CityMapId = NULL
END
GO

CREATE TABLE [dbo].[Services](
[Id] [int] IDENTITY NOT NULL,
[CityId] [int] NOT NULL,
[CityMapId] [int] NULL,
[Education] [int] NOT NULL DEFAULT 0,
[EducationFee] [int] NOT NULL DEFAULT 0,
[University] [int] NOT NULL DEFAULT 0,
[UniversityFee] [int] NOT NULL DEFAULT 1,
[Healthcare] [int] NOT NULL DEFAULT 0,
[HealthcareFee] [int] NOT NULL DEFAULT 0,
[LocalTransport] [int] NOT NULL DEFAULT 0,
[LocalTransportFee] [int] NOT NULL DEFAULT 1,
[GlobalTransport] [int] NOT NULL DEFAULT 0,
[GlobalTransportFee] [int] NOT NULL DEFAULT 2,
[Media] [int] NOT NULL DEFAULT 0,
[MediaFee] [int] NOT NULL DEFAULT 0,
[Safety] [int] NOT NULL DEFAULT 0,
[SafetyFee] [int] NOT NULL DEFAULT 0
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE PROCEDURE [dbo].[sp_GetCityServices]
(
	@CityId nvarchar(100)
)
AS
BEGIN
  SELECT 
	s.CityId, s.CityMapId,
	s.Education, s.University, s.Healthcare, s.LocalTransport, s.GlobalTransport, s.Media, s.Safety,
	s.EducationFee, s.UniversityFee, s.HealthcareFee, s.LocalTransportFee, s.GlobalTransportFee, s.MediaFee, s.SafetyFee
  FROM [dbo].[Services] s
  WHERE s.CityId = @CityId AND s.CityMapId = NULL
END
GO

CREATE TABLE [dbo].[Finance](
[Id] [int] IDENTITY NOT NULL,
[CityId] [int] NOT NULL,
[CityMapId] [int] NULL,
[TaxSummary] [int] NOT NULL DEFAULT 0,
[TaxPercentage] [int] NOT NULL DEFAULT 0,
[IndustryTaxing] [int] NOT NULL DEFAULT 0,
[PublicServiceCost] [int] NOT NULL DEFAULT 0,
[Summary] [int] NOT NULL DEFAULT 0
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE PROCEDURE [dbo].[sp_GetCityFinance]
(
	@CityId nvarchar(100)
)
AS
BEGIN
  SELECT 
	f.CityId, f.CityMapId,
	f.TaxSummary, f.TaxPercentage, f.IndustryTaxing, f.PublicServiceCost, f.Summary
  FROM [dbo].[Finance] f
  WHERE f.CityId = @CityId AND f.CityMapId = NULL
END
GO