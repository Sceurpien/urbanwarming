USE [master]
GO

CREATE LOGIN [uw_user] WITH PASSWORD = 'urbanwarming';
GO

/****** Object:  Database [UW_Local]    Script Date: 2019. 03. 24. 21:14:14 ******/
CREATE DATABASE [UW_Local]
GO

ALTER DATABASE [UW_Local] SET COMPATIBILITY_LEVEL = 140
GO

ALTER DATABASE [UW_Local] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [UW_Local] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [UW_Local] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [UW_Local] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [UW_Local] SET ARITHABORT OFF 
GO

ALTER DATABASE [UW_Local] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [UW_Local] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [UW_Local] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [UW_Local] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [UW_Local] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [UW_Local] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [UW_Local] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [UW_Local] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [UW_Local] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [UW_Local] SET  DISABLE_BROKER 
GO

ALTER DATABASE [UW_Local] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [UW_Local] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [UW_Local] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [UW_Local] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [UW_Local] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [UW_Local] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [UW_Local] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [UW_Local] SET RECOVERY FULL 
GO

ALTER DATABASE [UW_Local] SET  MULTI_USER 
GO

ALTER DATABASE [UW_Local] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [UW_Local] SET DB_CHAINING OFF 
GO

ALTER DATABASE [UW_Local] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [UW_Local] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [UW_Local] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [UW_Local] SET QUERY_STORE = OFF
GO

ALTER DATABASE [UW_Local] SET  READ_WRITE 
GO




USE [UW_Local]
GO

CREATE USER [uw_user] FOR LOGIN [uw_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [uw_user]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
[Id] [nvarchar](100) NOT NULL,
[UserName] [nvarchar](300) NOT NULL,
[Email] [nvarchar](1000) NOT NULL,
[PictureLink] [nvarchar](1000) NOT NULL,
[UserDescription] [nvarchar](max) NOT NULL,
[CountryId] [int] NULL,
[CreatedBy] [nvarchar](100) NOT NULL,
[CreatedAt] [datetime] NOT NULL,
[LastChangedBy] [nvarchar](100) NOT NULL,
[LastChangedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
CREATE INDEX i_User_UserName ON [User] (UserName);
GO

CREATE TABLE [dbo].[Location](
[Id] [int] IDENTITY NOT NULL,
[Longitude] [float] NOT NULL,
[Lattitude] [float] NOT NULL,
[CreatedBy] [nvarchar](100) NOT NULL,
[CreatedAt] [datetime] NOT NULL,
[LastChangedBy] [nvarchar](100) NOT NULL,
[LastChangedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE INDEX i_Location_Longitude ON [Location] (Longitude);
GO
CREATE INDEX i_Location_Lattitude ON [Location] (Lattitude);
GO
CREATE INDEX i_Location_LongitudeLattitude ON [Location] (Longitude, Lattitude);
GO

CREATE TABLE [dbo].[City](
[Id] [int] IDENTITY NOT NULL,
[Name] [nvarchar](1000) NOT NULL,
[CityTypeId] [int] NOT NULL,
[LocationId] [int] NOT NULL,
[Level] [int] NOT NULL,
[CreatedBy] [nvarchar](100) NOT NULL,
[CreatedAt] [datetime] NOT NULL,
[LastChangedBy] [nvarchar](100) NOT NULL,
[LastChangedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE INDEX i_City_Name ON City (Name);
GO
CREATE INDEX i_City_CityTypeId ON City (CityTypeId);
GO

CREATE TABLE [dbo].[CityToUser](
[Id] [int] IDENTITY NOT NULL,
[CityId] [int] NOT NULL,
[UserId] [int] NOT NULL,
[Owner] [bit] NOT NULL,
[CreatedBy] [nvarchar](100),
[CreatedAt] [datetime] NOT NULL,
[LastChangedBy] [nvarchar](100),
[LastChangedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE INDEX i_CityToUser_CityId ON CityToUser (CityId);
GO
CREATE INDEX i_CityToUser_UserId ON CityToUser (UserId);
GO

CREATE TABLE [dbo].[CityType](
[Id] [int] NOT NULL,
[Name] [nvarchar](1000) NOT NULL,
[OfficialName] [nvarchar](1000) NOT NULL,
[FictionalName] [nvarchar](1000) NOT NULL,
[Region] [nvarchar](1000) NOT NULL,
[SeaConnection] [bit] NOT NULL,
[RoadConnection] [bit] NOT NULL,
[Difficulty] [nvarchar](1000),
[Description] [nvarchar](max),
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO


CREATE TABLE [dbo].[CityMap](
[Id] [int] IDENTITY NOT NULL,
[CityId] [int] NOT NULL,
[CityMapTypeId] [int] NOT NULL,
[CityMapZoneId] [int] NOT NULL,
[XCoordinate] [int] NOT NULL,
[YCoordinate] [int] NOT NULL,
[Name] [nvarchar](1000) NOT NULL,
[Level] [int] NOT NULL,
[CreatedBy] [nvarchar](100),
[CreatedAt] [datetime] NOT NULL,
[LastChangedBy] [nvarchar](100),
[LastChangedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO
CREATE INDEX i_CityMap_CityId ON CityMap (CityId);
GO
CREATE INDEX i_CityMap_Coordinates ON CityMap (XCoordinate, YCoordinate);
GO

CREATE TABLE [dbo].[CityMapType](
[Id] [int] NOT NULL,
[Name] [nvarchar](1000) NOT NULL,
[OfficialName] [nvarchar](1000) NOT NULL,
[FictionalName] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[CityMapZone](
[Id] [int] NOT NULL,
[Name] [nvarchar](1000) NOT NULL,
[CityMapTypeId] [int] NOT NULL,
[OfficialName] [nvarchar](1000) NOT NULL,
[FictionalName] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

INSERT INTO  [dbo].[CityType] (Id,FictionalName,Name,OfficialName,Region,SeaConnection,RoadConnection)
VALUES	(1,'Hanseatic','HarborCity','Harbor City','Continental',1,1),
		(2,'Alpine','MountainCity','Mountain City','Continental',0,1),
		(3,'Hilltop','HilltopCity','Hilltop City','Continental',0,1),
		(4,'Oppidum','ContinentalCity','Continental City','Continental',0,1),
		(5,'Estuary','RivertradeCity','Rivertrade City','Continental',0,1),
		(6,'Cove City','BayCity','Bay City','Continental',1,1),
		(7,'Wasteland','DesertCity','Desert City','Desert',0,1),
		(8,'Oasis','OasisCity','Oasis City','Desert',0,1),
		(9,'Pharos','DesertCoastalCity','Desert Coastal City','Desert',1,1),
		(10,'Crossroads','DesertMarketCity','Desert Market City','Desert',0,1),
		(11,'Shore','BeachCity','Beach City','Mediterranean',1,1),
		(12,'Seaside','CoastalCity','Coastal City','Mediterranean',1,1),
		(13,'Flower City','MediterraneanCity','Mediterranean City','Mediterranean',0,1),
		(14,'Archaic','ClassicalCity','Classical City','Mediterranean',0,1),
		(15,'Fjords','FjordCity','Fjord City','Artic',1,1),
		(16,'Snowland','TundraCity','Tundra City','Artic',0,1),
		(17,'Reindeerland','TaigaCity','Taiga City','Artic',0,1),
		(18,'Walrus City','FishingIslandCity','Fishing Island City','Artic',1,0),
		(19,'Island Paradise','TropicalIslandCity','Tropical Island City','Tropic',1,0),
		(20,'Jungletown','TropicalCity','Tropical City','Tropic',0,1),
		(21,'Gemstone Jungle','JungleMiningCity','Jungle Mining City','Tropic',0,1),
		(22,'Coastal Paradise','TropicalCoastalCity','Tropical Coastal City','Tropic',1,1);
GO


INSERT INTO  [dbo].[CityMapType] (Id,FictionalName,Name,OfficialName)
VALUES	(1,'Sea','Sea','Sea'),
		(2,'SandyBeach','Sandy Beach','Sandy Beach'),
		(3,'GrassBeach','Grass Beach','Grass Beach'),
		(4,'CliffBeach','Cliff Beach','Cliff Beach'),
		(5,'Plains','Plains','Plains'),
		(6,'RiverBank','RiverBank','RiverBank'),
		(7,'SmallHills','Small Hills','Small Hills'),
		(8,'Sand','Sand','Sand'),
		(9,'Dunes','Dunes','Dunes'),
		(10,'LakeArea','Lake Area','Lake Area'),
		(11,'Hills','Hills','Hills'),
		(12,'Mountain','Mountain','Mountain'),
		(13,'Valley','Valley','Valley');
GO

INSERT INTO  [dbo].[CityMapZone] (Id,CityMapTypeId,FictionalName,Name,OfficialName)
VALUES	(1,5,'Oldtown','Oldtown','Oldtown'),
		(2,5,'Central','Central','Central'),
		(3,5,'Business','Business','Business'),
		(4,5,'Garden','Garden','Garden'),
		(5,5,'Recreation','Recreation','Recreation'),
		(6,5,'Projects','Projects','Projects'),
		(7,5,'Industry','Industry','Industry'),
		(8,5,'Science','Science','Science'),
		(9,5,'University','University','University'),
		(10,5,'Rural','Rural','Rural'),
		(11,5,'Wild','Wild','Wild');
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TemplateCity](
[Id] [int] IDENTITY NOT NULL,
[CityTypeId] [int] NOT NULL,
[Name] [nvarchar](1000) NOT NULL
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[TemplateCityPart](
[Id] [int] IDENTITY NOT NULL,
[TemplateCityId] [int] NOT NULL,
[CityMapZoneId] [int] NOT NULL,
[XCoordinate] [int] NOT NULL,
[YCoordinate] [int] NOT NULL
PRIMARY KEY CLUSTERED 
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

SET IDENTITY_INSERT [TemplateCity] ON;  
GO  
INSERT INTO  [dbo].[TemplateCity] (Id,CityTypeId,Name)
VALUES	(1,4,'');
GO
SET IDENTITY_INSERT [TemplateCity] OFF;  
GO  

INSERT INTO  [dbo].[TemplateCityPart] (TemplateCityId,CityMapZoneId,XCoordinate,YCoordinate)
VALUES	
(1,11,0,0),(1,11,1,0),(1,11,2,0),(1,11,3,0),(1,11,4,0),(1,11,5,0),(1,11,6,0),(1,11,7,0),(1,11,8,0),(1,11,9,0),(1,11,10,0),(1,11,11,0),(1,11,12,0),(1,11,13,0),(1,11,14,0),(1,11,15,0),(1,11,16,0),(1,11,17,0),(1,11,18,0),(1,11,19,0),(1,11,20,0),(1,11,21,0),(1,11,22,0),(1,11,23,0),(1,11,24,0),
(1,11,0,1),(1,11,1,1),(1,11,2,1),(1,11,3,1),(1,11,4,1),(1,11,5,1),(1,11,6,1),(1,11,7,1),(1,11,8,1),(1,11,9,1),(1,11,10,1),(1,11,11,1),(1,11,12,1),(1,11,13,1),(1,11,14,1),(1,11,15,1),(1,11,16,1),(1,11,17,1),(1,11,18,1),(1,11,19,1),(1,11,20,1),(1,11,21,1),(1,11,22,1),(1,11,23,1),(1,11,24,1),
(1,11,0,2),(1,11,1,2),(1,11,2,2),(1,11,3,2),(1,11,4,2),(1,11,5,2),(1,11,6,2),(1,11,7,2),(1,11,8,2),(1,11,9,2),(1,11,10,2),(1,11,11,2),(1,11,12,2),(1,11,13,2),(1,11,14,2),(1,11,15,2),(1,11,16,2),(1,11,17,2),(1,11,18,2),(1,11,19,2),(1,11,20,2),(1,11,21,2),(1,11,22,2),(1,11,23,2),(1,11,24,2),
(1,11,0,3),(1,11,1,3),(1,11,2,3),(1,11,3,3),(1,11,4,3),(1,11,5,3),(1,11,6,3),(1,11,7,3),(1,11,8,3),(1,11,9,3),(1,11,10,3),(1,11,11,3),(1,11,12,3),(1,11,13,3),(1,11,14,3),(1,11,15,3),(1,11,16,3),(1,11,17,3),(1,11,18,3),(1,11,19,3),(1,11,20,3),(1,11,21,3),(1,11,22,3),(1,11,23,3),(1,11,24,3),
(1,11,0,4),(1,11,1,4),(1,11,2,4),(1,11,3,4),(1,11,4,4),(1,11,5,4),(1,11,6,4),(1,11,7,4),(1,11,8,4),(1,11,9,4),(1,11,10,4),(1,11,11,4),(1,11,12,4),(1,11,13,4),(1,11,14,4),(1,11,15,4),(1,11,16,4),(1,11,17,4),(1,11,18,4),(1,11,19,4),(1,11,20,4),(1,11,21,4),(1,11,22,4),(1,11,23,4),(1,11,24,4),
(1,11,0,5),(1,11,1,5),(1,11,2,5),(1,11,3,5),(1,11,4,5),(1,11,5,5),(1,11,6,5),(1,11,7,5),(1,11,8,5),(1,11,9,5),(1,11,10,5),(1,11,11,5),(1,11,12,5),(1,11,13,5),(1,11,14,5),(1,11,15,5),(1,11,16,5),(1,11,17,5),(1,11,18,5),(1,11,19,5),(1,11,20,5),(1,11,21,5),(1,11,22,5),(1,11,23,5),(1,11,24,5),
(1,11,0,6),(1,11,1,6),(1,11,2,6),(1,11,3,6),(1,11,4,6),(1,11,5,6),(1,11,6,6),(1,11,7,6),(1,11,8,6),(1,11,9,6),(1,11,10,6),(1,11,11,6),(1,11,12,6),(1,11,13,6),(1,11,14,6),(1,11,15,6),(1,11,16,6),(1,11,17,6),(1,11,18,6),(1,11,19,6),(1,11,20,6),(1,11,21,6),(1,11,22,6),(1,11,23,6),(1,11,24,6),
(1,11,0,7),(1,11,1,7),(1,11,2,7),(1,11,3,7),(1,11,4,7),(1,11,5,7),(1,11,6,7),(1,11,7,7),(1,11,8,7),(1,11,9,7),(1,11,10,7),(1,11,11,7),(1,11,12,7),(1,11,13,7),(1,11,14,7),(1,11,15,7),(1,11,16,7),(1,11,17,7),(1,11,18,7),(1,11,19,7),(1,11,20,7),(1,11,21,7),(1,11,22,7),(1,11,23,7),(1,11,24,7),
(1,11,0,8),(1,11,1,8),(1,11,2,8),(1,11,3,8),(1,11,4,8),(1,11,5,8),(1,11,6,8),(1,11,7,8),(1,11,8,8),(1,11,9,8),(1,5,10,8),(1,4,11,8),(1,6,12,8),(1,10,13,8),(1,11,14,8),(1,11,15,8),(1,11,16,8),(1,11,17,8),(1,11,18,8),(1,10,19,8),(1,11,20,8),(1,11,21,8),(1,11,22,8),(1,11,23,8),(1,11,24,8),
(1,11,0,9),(1,11,1,9),(1,11,2,9),(1,11,3,9),(1,11,4,9),(1,11,5,9),(1,11,6,9),(1,11,7,9),(1,11,8,9),(1,11,9,9),(1,11,10,9),(1,1,11,9),(1,3,12,9),(1,6,13,9),(1,11,14,9),(1,11,15,9),(1,11,16,9),(1,11,17,9),(1,10,18,9),(1,10,19,9),(1,11,20,9),(1,11,21,9),(1,11,22,9),(1,11,23,9),(1,11,24,9),
(1,11,0,10),(1,11,1,10),(1,11,2,10),(1,11,3,10),(1,11,4,10),(1,11,5,10),(1,11,6,10),(1,11,7,10),(1,11,8,10),(1,11,9,10),(1,11,10,10),(1,2,11,10),(1,3,12,10),(1,6,13,10),(1,11,14,10),(1,11,15,10),(1,11,16,10),(1,11,17,10),(1,10,18,10),(1,11,19,10),(1,11,20,10),(1,11,21,10),(1,11,22,10),(1,11,23,10),(1,11,24,10),
(1,11,0,11),(1,11,1,11),(1,11,2,11),(1,11,3,11),(1,11,4,11),(1,11,5,11),(1,11,6,11),(1,11,7,11),(1,11,8,11),(1,11,9,11),(1,6,10,11),(1,6,11,11),(1,6,12,11),(1,10,13,11),(1,11,14,11),(1,11,15,11),(1,11,16,11),(1,11,17,11),(1,11,18,11),(1,11,19,11),(1,11,20,11),(1,11,21,11),(1,11,22,11),(1,11,23,11),(1,11,24,11),
(1,11,0,12),(1,11,1,12),(1,11,2,12),(1,11,3,12),(1,11,4,12),(1,11,5,12),(1,11,6,12),(1,11,7,12),(1,11,8,12),(1,11,9,12),(1,7,10,12),(1,7,11,12),(1,11,12,12),(1,11,13,12),(1,11,14,12),(1,11,15,12),(1,11,16,12),(1,11,17,12),(1,11,18,12),(1,11,19,12),(1,11,20,12),(1,11,21,12),(1,11,22,12),(1,11,23,12),(1,11,24,12),
(1,11,0,13),(1,11,1,13),(1,11,2,13),(1,11,3,13),(1,11,4,13),(1,11,5,13),(1,11,6,13),(1,11,7,13),(1,11,8,13),(1,11,9,13),(1,11,10,13),(1,11,11,13),(1,11,12,13),(1,11,13,13),(1,11,14,13),(1,11,15,13),(1,11,16,13),(1,11,17,13),(1,11,18,13),(1,11,19,13),(1,11,20,13),(1,11,21,13),(1,11,22,13),(1,11,23,13),(1,11,24,13),
(1,11,0,14),(1,11,1,14),(1,11,2,14),(1,11,3,14),(1,11,4,14),(1,11,5,14),(1,11,6,14),(1,11,7,14),(1,11,8,14),(1,11,9,14),(1,11,10,14),(1,11,11,14),(1,11,12,14),(1,11,13,14),(1,11,14,14),(1,11,15,14),(1,11,16,14),(1,11,17,14),(1,11,18,14),(1,11,19,14),(1,11,20,14),(1,11,21,14),(1,11,22,14),(1,11,23,14),(1,11,24,14),
(1,11,0,15),(1,11,1,15),(1,11,2,15),(1,11,3,15),(1,11,4,15),(1,11,5,15),(1,11,6,15),(1,11,7,15),(1,11,8,15),(1,11,9,15),(1,11,10,15),(1,11,11,15),(1,11,12,15),(1,11,13,15),(1,11,14,15),(1,11,15,15),(1,11,16,15),(1,11,17,15),(1,11,18,15),(1,11,19,15),(1,11,20,15),(1,11,21,15),(1,11,22,15),(1,11,23,15),(1,11,24,15),
(1,11,0,16),(1,11,1,16),(1,11,2,16),(1,11,3,16),(1,11,4,16),(1,11,5,16),(1,11,6,16),(1,11,7,16),(1,11,8,16),(1,11,9,16),(1,11,10,16),(1,11,11,16),(1,11,12,16),(1,11,13,16),(1,11,14,16),(1,11,15,16),(1,11,16,16),(1,11,17,16),(1,11,18,16),(1,11,19,16),(1,11,20,16),(1,11,21,16),(1,11,22,16),(1,11,23,16),(1,11,24,16),
(1,11,0,17),(1,11,1,17),(1,11,2,17),(1,11,3,17),(1,11,4,17),(1,11,5,17),(1,11,6,17),(1,11,7,17),(1,11,8,17),(1,11,9,17),(1,11,10,17),(1,11,11,17),(1,11,12,17),(1,11,13,17),(1,11,14,17),(1,11,15,17),(1,11,16,17),(1,11,17,17),(1,11,18,17),(1,11,19,17),(1,11,20,17),(1,11,21,17),(1,11,22,17),(1,11,23,17),(1,11,24,17),
(1,11,0,18),(1,11,1,18),(1,11,2,18),(1,11,3,18),(1,11,4,18),(1,11,5,18),(1,11,6,18),(1,11,7,18),(1,11,8,18),(1,11,9,18),(1,11,10,18),(1,11,11,18),(1,11,12,18),(1,11,13,18),(1,11,14,18),(1,11,15,18),(1,11,16,18),(1,11,17,18),(1,11,18,18),(1,11,19,18),(1,11,20,18),(1,11,21,18),(1,11,22,18),(1,11,23,18),(1,11,24,18),
(1,11,0,19),(1,11,1,19),(1,11,2,19),(1,11,3,19),(1,11,4,19),(1,11,5,19),(1,11,6,19),(1,11,7,19),(1,11,8,19),(1,11,9,19),(1,11,10,19),(1,11,11,19),(1,11,12,19),(1,11,13,19),(1,11,14,19),(1,11,15,19),(1,11,16,19),(1,11,17,19),(1,11,18,19),(1,11,19,19),(1,11,20,19),(1,11,21,19),(1,11,22,19),(1,11,23,19),(1,11,24,19),
(1,11,0,20),(1,11,1,20),(1,11,2,20),(1,11,3,20),(1,11,4,20),(1,11,5,20),(1,11,6,20),(1,11,7,20),(1,11,8,20),(1,11,9,20),(1,11,10,20),(1,11,11,20),(1,11,12,20),(1,11,13,20),(1,11,14,20),(1,11,15,20),(1,11,16,20),(1,11,17,20),(1,11,18,20),(1,11,19,20),(1,11,20,20),(1,11,21,20),(1,11,22,20),(1,11,23,20),(1,11,24,20),
(1,11,0,21),(1,11,1,21),(1,11,2,21),(1,11,3,21),(1,11,4,21),(1,11,5,21),(1,11,6,21),(1,11,7,21),(1,11,8,21),(1,11,9,21),(1,11,10,21),(1,11,11,21),(1,11,12,21),(1,11,13,21),(1,11,14,21),(1,11,15,21),(1,11,16,21),(1,11,17,21),(1,11,18,21),(1,11,19,21),(1,11,20,21),(1,11,21,21),(1,11,22,21),(1,11,23,21),(1,11,24,21),
(1,11,0,22),(1,11,1,22),(1,11,2,22),(1,11,3,22),(1,11,4,22),(1,11,5,22),(1,11,6,22),(1,11,7,22),(1,11,8,22),(1,11,9,22),(1,11,10,22),(1,11,11,22),(1,11,12,22),(1,11,13,22),(1,11,14,22),(1,11,15,22),(1,11,16,22),(1,11,17,22),(1,11,18,22),(1,11,19,22),(1,11,20,22),(1,11,21,22),(1,11,22,22),(1,11,23,22),(1,11,24,22),
(1,11,0,23),(1,11,1,23),(1,11,2,23),(1,11,3,23),(1,11,4,23),(1,11,5,23),(1,11,6,23),(1,11,7,23),(1,11,8,23),(1,11,9,23),(1,11,10,23),(1,11,11,23),(1,11,12,23),(1,11,13,23),(1,11,14,23),(1,11,15,23),(1,11,16,23),(1,11,17,23),(1,11,18,23),(1,11,19,23),(1,11,20,23),(1,11,21,23),(1,11,22,23),(1,11,23,23),(1,11,24,23),
(1,11,0,24),(1,11,1,24),(1,11,2,24),(1,11,3,24),(1,11,4,24),(1,11,5,24),(1,11,6,24),(1,11,7,24),(1,11,8,24),(1,11,9,24),(1,11,10,24),(1,11,11,24),(1,11,12,24),(1,11,13,24),(1,11,14,24),(1,11,15,24),(1,11,16,24),(1,11,17,24),(1,11,18,24),(1,11,19,24),(1,11,20,24),(1,11,21,24),(1,11,22,24),(1,11,23,24),(1,11,24,24);
GO