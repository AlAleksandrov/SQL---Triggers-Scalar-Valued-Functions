USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetConfigLIUMF]    Script Date: 2024-11-04 15:53:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetConfigLIUMF](
	@inputString1 NVARCHAR(MAX),
	@inputString2 NVARCHAR(MAX),
	@inputString3 NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @outputString1 NVARCHAR(MAX)
	SET @outputString1 =
		'%' + SUBSTRING(@inputString1, 2, LEN(@inputString1)-1) +
        SUBSTRING(@inputString3, 1, LEN(@inputString3)-1) +
        SUBSTRING(@inputString2, 1, LEN(@inputString2)-1) + '%'
    RETURN @outputString1
END;
