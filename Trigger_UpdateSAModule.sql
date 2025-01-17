USE [DBLB]
GO
/****** Object:  Trigger [db_owner].[UpdateSAModule]    Script Date: 2024-11-04 15:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [db_owner].[UpdateSAModule]
	ON [db_owner].[tbl_data_Index]
	After INSERT, UPDATE
AS
Begin
	WITH CTE AS (
    SELECT 
        [A-Nr],
        STUFF((
            SELECT ', ' + [Sampling Information EMPB]
            FROM [DBLB].[db_owner].[tbl_data_Index] t2
            WHERE t1.[A-Nr] = t2.[A-Nr]
            FOR XML PATH('')
        ), 1, 2, '') AS TempSA
    FROM [DBLB].[db_owner].[tbl_data_Index] t1
    WHERE [Sampling Information EMPB] IS NOT NULL
    GROUP BY [A-Nr]
)
UPDATE [db_owner].[tbl_data_Module]
SET [Sampling Information] = CTE.TempSA
FROM [db_owner].[tbl_data_Module]
INNER JOIN CTE ON [db_owner].[tbl_data_Module].[A-Nr] = CTE.[A-Nr];
End;
