Create Database Consultas
go
Use Consultas
go
Create Table Paises(
    ID_Pais int not null Primary Key Identity(1,1),
    Pais nvarchar(50) not null
)
go
Create Table Provincias(
    ID_Provincia int not null Primary Key Identity(1, 1),
    Provincia nvarchar(50) not null,
    ID_Pais int not null Foreign Key References Paises(ID_Pais)
)
go
Create Table Ciudades(
    ID_Ciudad int not null Primary Key Identity(1,1),
    Ciudad nvarchar(50) not null,
    ID_Provincia int not null Foreign Key References Provincias(ID_Provincia)
)
go
Create Table Alumnos(
    Legajo int not null Primary Key,
    Apellido varchar(100) not null,
    Nombre varchar(100) not null,
    Fecha_Nacimiento smalldatetime not null,
    Direccion varchar(100) not null,
    ID_Ciudad_Nacimiento int not null Foreign Key References Ciudades(ID_Ciudad),
    Telefono varchar(20) null,
    Email varchar(50) null,
    Sexo char(1) null
)
go