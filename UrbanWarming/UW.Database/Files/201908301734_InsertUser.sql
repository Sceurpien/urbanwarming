SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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