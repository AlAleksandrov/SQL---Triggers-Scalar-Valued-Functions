USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNotesIP1]    Script Date: 2024-11-04 15:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetNotesIP1](
    @inputString1 NVARCHAR(20),
    @inputString2 NVARCHAR(5),
    @inputString3 BIT,
    @inputString4 NVARCHAR(5),
    @inputString5 NVARCHAR(5),
    @inputString6 NVARCHAR(5),
    @inputString7 NVARCHAR(5)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @outputString NVARCHAR(80)

    SET @outputString = CONCAT(@inputString1, ' - ', IIF(@inputString3=1, CONCAT('common between ',@inputString2), @inputString2), IIF(@inputString4 is NULL,'',CONCAT(' & ',@inputString4)), IIF(@inputString5 is NULL,'',CONCAT(' & ', @inputString5)), IIF(@inputString6 is NULL,'',CONCAT(' & ', @inputString6)), IIF(@inputString7 is NULL,'',CONCAT(' & ', @inputString7)))

    RETURN @outputString
END;