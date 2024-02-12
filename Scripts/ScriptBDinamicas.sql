--Creacion de base de datos
create database nortwind2
on primary 
(name=Nortwind1_data, filename='C:\sqlserver\data\nortwind.mdf',
size=50MB, -- Minimo es de 521 kb, el predeterminado es de un 1mb
Filegrowth=25% -- por default es alrededor de 10%
)
log on
(
name = Northwind_Log, filename='C:\sqlserver\log\nortwind1.ldf',
size=25MB, 
Filegrowth=25%
)
go



--comando clase 08/02/2024

-- creacion de files groups

alter database nortwind2 add filegroup GRUPODATA1

alter database nortwind2 add filegroup GRUPODATA2

--ASOCIAR ARCHIVOS A FILEGROUPS 
alter database nortwind2 add file
(
name=Nortwind1_data_secundario,
filename='C:\sqlserver\data\nortwind1_data_secundario.ndf',
size=15MB,
maxsize=50MB,
filegrowth=1MB)
to filegroup GRUPODATA1

alter database nortwind2 add file
(
name=Nortwind1_data_secundario2,
filename='C:\sqlserver\data\nortwind1_data_secundario2.ndf',
size=15MB,
maxsize=50MB,
filegrowth=1MB)
to filegroup GRUPODATA2



