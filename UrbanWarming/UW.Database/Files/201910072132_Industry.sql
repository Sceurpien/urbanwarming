SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Industry](
[Id] [int] IDENTITY NOT NULL,
[CityId] [int] NOT NULL,
[CityMapId] [int] NULL,
[Agriculture] [int] NOT NULL DEFAULT 0,
[AgricultureTax] [int] NOT NULL DEFAULT 5,
[Mining] [int] NOT NULL DEFAULT 0,
[MiningTax] [int] NOT NULL DEFAULT 5,
[Construction] [int] NOT NULL DEFAULT 0,
[ConstructionTax] [int] NOT NULL DEFAULT 5,
[Manufacturing] [int] NOT NULL DEFAULT 0,
[ManufacturingTax] [int] NOT NULL DEFAULT 5,
[TradeAndWarehousing] [int] NOT NULL DEFAULT 0,
[TradeAndWarehousingTax] [int] NOT NULL DEFAULT 5,
[InformationTechnology] [int] NOT NULL DEFAULT 0,
[InformationTechnologyTax] [int] NOT NULL DEFAULT 5,
[FinanceAndInsurance] [int] NOT NULL DEFAULT 0,
[FinanceAnsInsuranceTax] [int] NOT NULL DEFAULT 5,
[SocialServices] [int] NOT NULL DEFAULT 0,
[SocialServicesTax] [int] NOT NULL DEFAULT 0,
[OtherServices] [int] NOT NULL DEFAULT 0,
[OtherServicesTax] [int] NOT NULL DEFAULT 5,
[Entertainment] [int] NOT NULL DEFAULT 0,
[EntertainmentTax] [int] NOT NULL DEFAULT 5
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE PROCEDURE [dbo].[sp_GetCityIndustry]
(
	@CityId nvarchar(100)
)
AS
BEGIN
  SELECT 
	i.CityId, i.CityMapId,
	i.Agriculture, i.Mining, i.Construction, i.Manufacturing, i.TradeAndWarehousing,
	i.InformationTechnology, i.FinanceAndInsurance, i.SocialServices, i.OtherServices, i.Entertainment,
	i.AgricultureTax, i.MiningTax, i.ConstructionTax, i.ManufacturingTax, i.TradeAndWarehousingTax,
	i.InformationTechnologyTax, i.FinanceAndInsuranceTax, i.SocialServicesTax, i.OtherServicesTax, i.EntertainmentTax
  FROM [dbo].[Industry] i
  WHERE i.CityId = @CityId AND i.CityMapId = NULL
END
GO