USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMiddleString_NOK]    Script Date: 2024-11-04 15:56:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetMiddleString_NOK](
    @inputString NVARCHAR(MAX),
    @numLeftChars INT,
    @numRightChars INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @outputString NVARCHAR(MAX)
    SET @outputString = SUBSTRING(@inputString, @numLeftChars + 1, LEN(@inputString) - @numLeftChars - @numRightChars)
    RETURN @outputString
END