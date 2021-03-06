SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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