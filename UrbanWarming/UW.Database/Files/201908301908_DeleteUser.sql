SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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