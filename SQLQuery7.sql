BACKUP DATABASE [AkirasBoutiques] TO  DISK = N'D:\SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AkirasBoutiques.bak' WITH NOFORMAT, NOINIT,  NAME = N'AkirasBoutiques-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10, CONTINUE_AFTER_ERROR
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'AkirasBoutiques' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'AkirasBoutiques' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''AkirasBoutiques'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'D:\SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AkirasBoutiques.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
