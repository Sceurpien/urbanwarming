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

CREATE PROCEDURE [dbo].[sp_GetUserById]
(
	@UserId nvarchar(100)
)
AS
BEGIN
	SELECT Id, UserName, Email, PictureLink, UserDescription, CountryId
	FROM dbo.[User]
	WHERE Id = @UserId
END
GO

CREATE PROCEDURE [dbo].[sp_InsertUser]
(
	@UserId nvarchar(100),
	@UserName nvarchar(1000),
	@Email nvarchar(1000),
	@PictureLink nvarchar(1000),
	@UserDescription nvarchar(1000),
	@CreatedBy nvarchar(100)
)
AS
BEGIN
	INSERT INTO [User] (Id, UserName, Email, PictureLink, UserDescription, CountryId, CreatedBy, CreatedAt, LastChangedBy, LastChangedAt)
	VALUES (@UserId, @UserName, @Email, @PictureLink, @UserDescription, 1, @CreatedBy, GETDATE(), @CreatedBy, GETDATE());
END
GO

CREATE PROCEDURE [dbo].[sp_DeleteUser]
(
	@UserId nvarchar(100)
)
AS
BEGIN
	DELETE [User] WHERE Id = @UserId
END
GO

CREATE PROCEDURE [dbo].[sp_GetUserByName]
(
	@UserName nvarchar(300)
)
AS 
BEGIN
	SELECT Id, UserName, Email, PictureLink, UserDescription, CountryId
	FROM dbo.[User]
	WHERE UserName = @UserName
END
GO

CREATE PROCEDURE [dbo].[sp_GetUserByEmail]
(
	@Email nvarchar(1000)
)
AS 
BEGIN
	SELECT Id, UserName, Email, PictureLink, UserDescription, CountryId
	FROM	 dbo.[User]
	WHERE Email = @Email
END
GO

CREATE PROCEDURE [dbo].[sp_GetCityTypes]
AS 
BEGIN
SELECT Id, Name, OfficialName, FictionalName, Region, SeaConnection, RoadConnection, Difficulty, Description
FROM dbo.[CityType]
END
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
