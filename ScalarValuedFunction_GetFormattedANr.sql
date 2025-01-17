USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetFormattedANr]    Script Date: 2024-11-04 15:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetFormattedANr](@inputString NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    RETURN
        SUBSTRING(@inputString, 1, 1) + ' ' +
        SUBSTRING(@inputString, 2, 3) + ' ' +
        SUBSTRING(@inputString, 5, 3) + ' ' +
        SUBSTRING(@inputString, 8, 2) + ' ' +
        SUBSTRING(@inputString, 10, 2)
END