USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNotesIP2]    Script Date: 2024-11-04 15:58:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetNotesIP2](
    @inputString1 NVARCHAR(55),
    @inputString2 NVARCHAR(55)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @outputString NVARCHAR(80)

    SET @outputString = IIF(@inputString1 is NULL,@inputString2,@inputString1)

    RETURN @outputString
END;
