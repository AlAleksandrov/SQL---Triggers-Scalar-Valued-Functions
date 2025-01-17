USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetStringLeft_NOK]    Script Date: 2024-11-04 15:58:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetStringLeft_NOK](@inputString NVARCHAR(MAX), @numCharacters INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    RETURN LEFT(@inputString, LEN(@inputString) - @numCharacters)
END