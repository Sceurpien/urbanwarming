SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Building](
[Id] [int] IDENTITY NOT NULL,
[CityId] [int] NOT NULL,
[CityMapId] [int] NULL,
[BuildingTypeId] [int] NOT NULL,
[BuildingClassId] [int] NOT NULL,
[Name] [nvarchar](1000) NULL,
[Level] [float] NOT NULL DEFAULT 0,
[Visitor] [int] NOT NULL DEFAULT 0,
[Employees] [int] NOT NULL DEFAULT 0,
[Maintenance] [float] NOT NULL DEFAULT 0,
[OnUpgrade] [int] NOT NULL DEFAULT 0,
[LastUpgrade] [datetime] NOT NULL DEFAULT 0
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[BuildingType](
[Id] [int] NOT NULL,
[Name] [nvarchar](1000) NULL,
[BuildingClassId] [int] NOT NULL,
[BasePrice] [float] NOT NULL DEFAULT 0,
[BaseMaintenance] [float] NOT NULL DEFAULT 0
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[BuildingClass](
[Id] [int] NOT NULL,
[Name] [nvarchar](1000) NULL
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

INSERT INTO  [dbo].[BuildingClass] (Id,Name)
VALUES	(1,'Healthcare'),
		(2,'Education'),
		(3,'Social Services'),
		(4,'Powerplant'),
		(5,'Transportation');
GO

INSERT INTO  [dbo].[BuildingType] (Id,Name,BuildingClassId,BasePrice,BaseMaintenance)
VALUES	(1,'Doctor Office',1,1,1),
		(2,'Hospital',1,1,1),
		(3,'School',2,1,1),
		(4,'Lyceum',2,1,1),
		(5,'Firestation',3,1,1),
		(6,'Police station',3,1,1)
		;
GO