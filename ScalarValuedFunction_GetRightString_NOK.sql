USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetRightString_NOK]    Script Date: 2024-11-04 15:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetRightString_NOK](@inputString NVARCHAR(MAX), @numCharacters INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    RETURN RIGHT(@inputString, LEN(@inputString) - @numCharacters)
END