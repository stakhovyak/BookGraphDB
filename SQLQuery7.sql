	-- Переход к базе данных master
USE master;
GO

-- Создание резервной копии базы данных BookGraphDB
BACKUP DATABASE BookGraphDB
TO DISK = 'C:\Backup\BookGraphDB.bak'
WITH FORMAT,
    MEDIANAME = 'SQLServerBackups',
    NAME = 'Full Backup of BookGraphDB';
GO

select @@SERVERNAME