USE [DBLB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetLIUMF]    Script Date: 2024-11-04 15:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetLIUMF](
    @inputString1 NVARCHAR(10),
    @inputString2 NVARCHAR(3),
    @inputString3 NVARCHAR(10),
    @inputString4 BIT,
    @inputString5 NVARCHAR(10),
    @inputString6 NVARCHAR(10),
    @inputString7 NVARCHAR(10),
    @inputString8 NVARCHAR(10)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @outputString1 NVARCHAR(20), @outputString2 NVARCHAR(20), @concatString NVARCHAR(20),@outputString3 NVARCHAR(7)

 

    SET @outputString1 = '%' + SUBSTRING(@inputString1, 2, LEN(@inputString1) - 1) +
        IIF((LEN(@inputString3) - 1) = 1, SUBSTRING(@inputString3, 1, 1), '%') +
        SUBSTRING(@inputString2, 1, LEN(@inputString2) - 1) + '%'

 

    SET @concatString = CONCAT(@inputString1, @inputString5, @inputString6, @inputString7, @inputString8)

 

    SET @outputString2 = '%' + IIF(@concatString = 'W206C236', '2%6', IIF(@concatString = 'V297V295', '29%', '')) +
        IIF((LEN(@inputString3) - 1) = 1, SUBSTRING(@inputString3, 1, 1), '%') +
        SUBSTRING(@inputString2, 1, LEN(@inputString2) - 1) + '%'

 
    SET @outputString3= IIF(@inputString4 = 1, 'True', 'False')

    RETURN IIF(@outputString3 = 'False', @outputString1, IIF(SUBSTRING(@outputString2, 1, 2) = '%%', SUBSTRING(@outputString2, 2, LEN(@outputString2) - 1), @outputString2))

END;
