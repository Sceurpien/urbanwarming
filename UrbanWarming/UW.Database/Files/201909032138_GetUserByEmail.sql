SET ANSI_NULLS ON
GO 
SET QUOTED_IDENTIFIER ON
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