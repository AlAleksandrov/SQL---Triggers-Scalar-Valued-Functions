USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetERPDescription2Part1]    Script Date: 2024-11-04 15:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetERPDescription2Part1](
    @inputString1 NVARCHAR(5),
    @inputString2 NVARCHAR(24),
    @inputString3 NVARCHAR(7),
    @inputString4 NVARCHAR(3)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @outputString NVARCHAR(55)

    SET @outputString = CONCAT(@inputString1, ' ', @inputString2, ' ', @inputString3, ' ', @inputString4)

    RETURN (@outputString)

END;
