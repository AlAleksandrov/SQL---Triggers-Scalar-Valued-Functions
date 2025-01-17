USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetERPDescription]    Script Date: 2024-11-04 15:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetERPDescription](
	@inputString1 NVARCHAR(12),
	@inputString2 NVARCHAR(100)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @outputString1 NVARCHAR(MAX),@outputString2 NVARCHAR(MAX)
	SET @outputString1 =         
		SUBSTRING(@inputString1, 1, 1) + ' ' +
        SUBSTRING(@inputString1, 2, 3) + ' ' +
        SUBSTRING(@inputString1, 5, 3) + ' ' +
        SUBSTRING(@inputString1, 8, 2) + ' ' +
        SUBSTRING(@inputString1, 10, 2)
    SET @outputString2 = SUBSTRING(@inputString2, 19, IIF(RIGHT(@inputString2,9)=' MOT.RAUM',LEN(@inputString2)-27,LEN(@inputString2)-26))
    RETURN CONCAT(@outputString1, ' ', @outputString2)
END;
