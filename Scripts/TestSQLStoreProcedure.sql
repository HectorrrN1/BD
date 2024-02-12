create database  nortwindTest
USE nortwindTest

create table cliente(
  [CustomerID] [nchar](5) NOT NULL,
  [CompanyName] [nvarchar](40) NOT NULL,
  [Country] [nvarchar](15) NULL,
  constraint pk_cliente
  primary key([CustomerID])
)


insert into cliente
select customerid, CompanyName, Country
from Northwind.dbo.Customers



alter proc spinsertar
@id nchar(5),
@name nvarchar(10),
@pais nvarchar(15)
as
declare @id2 nchar(5)
if @id < 0 begin
set @id2 = 99999
end 
else 
begin 
set @id2 = @id
end
insert into cliente
values(@id2, @name,@pais)

--ejecutar sp
execute spinsertar 'xxxxx','El puerco','Mexico'


end



--crear un sp en master 
create spCrearBD 
@nombre varchar(250)
as
begin
create database @nombre
end

exec spCrearBD '111111'

--store procedure que cree una base de datos con una variable dinamica(el nomnre de la bd)(create database @nombre)
--pasar todos los parametros 