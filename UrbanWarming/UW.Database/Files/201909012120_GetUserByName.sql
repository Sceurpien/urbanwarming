SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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