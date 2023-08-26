Use Consultas
go

-- Insertando registros para tabla Paises
Insert Into Paises(Pais) Values
('Argentina'),
('Estados Unidos'),
('España'),
('México'),
('Francia');

-- Insertando registros para tabla Provincias
Insert Into Provincias(Provincia, ID_Pais) Values
('Buenos Aires', 1),
('California', 2),
('Madrid', 3),
('Jalisco', 4),
('Île-de-France', 1);

-- Insertando registros para tabla Ciudades
Insert Into Ciudades (Ciudad, ID_Provincia) Values
('Buenos Aires', 6),
('Los Angeles', 8),
('Madrid', 9),
('Guadalajara', 10),
('Paris', 10);

-- Insertando registros para tabla Alumnos
Insert Into Alumnos (Legajo, Apellido, Nombre, Fecha_Nacimiento, Direccion, ID_Ciudad_Nacimiento, Telefono, Email, Sexo) Values
(1001, 'Perez', 'Juan', '1995-08-12', 'Calle 123, Ciudad', 4, '555-123-4567', 'juan@example.com', 'M'),
(1002, 'Garcia', 'Maria', '1998-04-25', 'Av. Principal, Ciudad', 2, '555-987-6543', 'maria@example.com', 'F'),
(1003, 'Lopez', 'Carlos', '1997-11-03', 'Plaza Central, Madrid', 6, '555-555-5555', 'carlos@example.com', 'M'),
(1004, 'Martinez', 'Laura', '1996-06-17', 'Calle 7, Guadalajara', 4, '555-222-3333', 'laura@example.com', 'F'),
(1005, 'Dubois', 'Pierre', '1999-02-08', 'Rue 42, Paris', 6, '555-888-9999', 'pierre@example.com', 'M');

-- Consultas de Accion
Update Ciudades set ID_Provincia = 10
Where ID_Provincia = 9

Update Provincias set ID_Provincia = 1
Where ID_Provincia = 6

Select A.Apellido, A.Nombre From Alumnos A
Where ID_Ciudad_Nacimiento = 6

-- Obteniendo todos los registros de todas las columnas de la tabla.
Select ID_Ciudad, Ciudad, ID_Provincia From Ciudades

-- Obteniendo los registros de toda las columnas de las tablas
Select * From Paises
Select * From Provincias
Select * From Alumnos

Select A.legajo, A.Apellido, A.Nombre, A.Fecha_Nacimiento From Alumnos A

-- Agregando y mostrando Columna Edad. Dicho resultado se calcula con la funcion
-- Datediff()
Select Legajo, Apellido, Nombre, Datediff(Year, 0, Getdate() - Fecha_Nacimiento)
As Edad From Alumnos

Select Apellido, 1 As Uno, 
'Hola mundo' As Hola, 
Month(Fecha_Nacimiento) As Mes,
Year(Fecha_Nacimiento) As Anio 
From Alumnos

-- Vemos si esta query nos trae registros duplicados
Select All Year(Fecha_Nacimiento) As Anio_Nac From Alumnos

-- Incluimos la expresion Distinct para evitar registros duplicados
Select Distinct Year(Fecha_Nacimiento) As Anio_Nac From Alumnos

-- Incluimos expresion order by
Select Legajo, Apellido, Nombre, ID_Ciudad_Nacimiento From Alumnos
Order By Legajo Desc

Select * From Alumnos Where Legajo >= 1000 And Legajo <= 1001

-- Operador Between
Select *From Alumnos Where Legajo Between 1000 And 1002

-- Operador IN
Select Legajo, Apellido, Nombre From Alumnos Where Legajo In (1001, 1005)

-- Operador Not IN
Select Legajo, Apellido, Nombre From Alumnos Where Legajo Not In (1001, 1005)

-- Operador Like
--Todos los datos de legajo, apellido y nombre de los alumnos cuyo legajo comience con 2.
Select Legajo, Apellido, Nombre From Alumnos Where Legajo Like '2%'

--Alumnos cuyo apellido comience con cualquier caracter de la A a la Z y finalice con 'EZ'
--siempre en cuando la antepenúltima letra no sea la R.
Select Legajo, Apellido, Nombre From Alumnos Where Apellido Like '%[A-Z][^R]ez'

Select Legajo, Apellido, Nombre, Email From Alumnos Where Email Is Not Null 