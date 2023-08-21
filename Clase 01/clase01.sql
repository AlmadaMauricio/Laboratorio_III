Create Database Clase_01
GO
Use Clase_01
GO
Create Table Areas(
    ID_Area tinyint primary key not null identity(1, 1),
    Nombre varchar(50) not null,
    Presupuesto money not null check(Presupuesto > 0),
    Mail varchar(100) not null unique
)
go
Create Table Empleados(
    Legajo int primary key not null,
    IDArea tinyint null foreign key references Areas(ID_Area),
    Apellido varchar(100) not null,
    Nombre varchar(100) not null,
    FechaNacimiento date null check(FechaNacimiento <= getdate())
)
