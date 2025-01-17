USE [DBLB]
GO
/****** Object:  Trigger [db_owner].[GetSamplInformEMPBUpdate]    Script Date: 2024-11-04 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [db_owner].[GetSamplInformEMPBUpdate] 
   ON  [db_owner].[tbl_data_ISIR] 
   AFTER INSERT,UPDATE
AS 
BEGIN
UPDATE t2
SET [Sampling Information EMPB] = 'EMPB created on ' + CONVERT(varchar, t1.[Sampling date], 23) + ' with Drawing Date ' + CONVERT(varchar, t2.[Drawing Date], 23) + ' (' + CONVERT(varchar, t2.QIndex , 23) + '/' + RIGHT(t2.[Index-Nr], 2) + ')' + ' For ' + t1.[Customer]
FROM [DBLB].[db_owner].[tbl_data_Index] t2
JOIN [DBLB].[db_owner].[tbl_data_ISIR] t1 ON t2.[Index-Nr] = t1.[Production Index]
WHERE t1.[Harness Nr] IS NOT NULL;
END;
