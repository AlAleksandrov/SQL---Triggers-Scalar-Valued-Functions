USE [DBLB]
GO
/****** Object:  Trigger [db_owner].[GetQIndexUpdate]    Script Date: 2024-11-04 15:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [db_owner].[GetQIndexUpdate] 
   ON  [db_owner].[tbl_data_ISIR] 
   AFTER INSERT,UPDATE
AS 
BEGIN

UPDATE db_owner.tbl_data_Index
SET db_owner.tbl_data_Index.QIndex = db_owner.tbl_data_ISIR.[E/Q Level]
FROM db_owner.tbl_data_Index INNER JOIN
db_owner.tbl_data_ISIR ON db_owner.tbl_data_Index.[Index-Nr] = db_owner.tbl_data_ISIR.[Production Index]
WHERE (db_owner.tbl_data_ISIR.[E/Q Level] IS NOT NULL) AND Checksum(db_owner.tbl_data_Index.QIndex) <> Checksum(db_owner.tbl_data_ISIR.[E/Q Level])
END;