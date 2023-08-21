Create Database AgregarDatosMLabo
go
Use AgregarDatosMLabo
go
Create Table Usuarios(
  ID_Usuarios bigint not null primary key identity (1, 1),
  Apellidos varchar(100),
  Nombres varchar(100)not null,
  Genero char not null,
  FechaNacimiento date not null,
  Domicilio varchar(500),
  ID_Localidad int not null,
  ID_SituacionCrediticia tinyint not null,
  Telefono varchar(20) null,
  Celular varchar(20) null,
  Mail varchar(250) not null unique  
)
go
Set Dateformat 'YMD'
Insert Into Usuarios(Apellidos, Nombres, Genero, FechaNacimiento, Domicilio, ID_Localidad, ID_SituacionCrediticia, Telefono, Celular, Mail)
Values
   ('García', 'María', 'F', '1990-05-15', 'Calle 123, Colonia A', 1, 2, '555-1234', '555-5678', 'maria@example.com'),
  ('López', 'Juan', 'M', '1985-09-22', 'Av. Principal, Barrio B', 2, 3, '555-9876', NULL, 'juan@example.com'),
  ('Martínez', 'Ana', 'F', '2000-02-10', 'Calle 456, Colonia C', 3, 1, NULL, '555-6543', 'ana@example.com'),
  ('Rodríguez', 'Carlos', 'M', '1978-11-30', 'Plaza Central, Barrio D', 1, 2, '555-7890', '555-1230', 'carlos@example.com'),
  ('Gómez', 'Laura', 'F', '1995-07-08', 'Calle 789, Colonia E', 2, 3, '555-2345', NULL, 'laura@example.com'),
  ('Pérez', 'Andrés', 'M', '1989-04-12', 'Av. Grande, Barrio F', 3, 1, NULL, '555-5670', 'andres@example.com'),
  ('Hernández', 'Isabel', 'F', '2002-01-25', 'Calle 567, Colonia G', 1, 2, '555-4567', '555-8901', 'isabel@example.com'),
  ('Díaz', 'Pedro', 'M', '1975-08-03', 'Av. Pequeña, Barrio H', 2, 3, '555-6789', NULL, 'pedro@example.com'),
  ('Sanchez', 'Sofía', 'F', '1998-12-18', 'Calle 890, Colonia I', 3, 1, NULL, '555-1234', 'sofia@example.com'),
  ('López', 'Miguel', 'M', '1982-06-29', 'Av. Central, Barrio J', 1, 2, '555-9876', '555-6543', 'miguel@example.com'),
  ('Ramírez', 'Daniela', 'F', '2001-03-07', 'Calle 123, Colonia K', 2, 3, '555-2345', NULL, 'daniela@example.com'),
  ('González', 'Luis', 'M', '1973-10-20', 'Av. Principal, Barrio L', 3, 1, NULL, '555-7890', 'luis@example.com'),
  ('Torres', 'Valentina', 'F', '1994-09-14', 'Calle 456, Colonia M', 1, 2, '555-5678', '555-1230', 'valentina@example.com'),
  ('Flores', 'Javier', 'M', '1987-07-02', 'Plaza Central, Barrio N', 2, 3, '555-9876', NULL, 'javier@example.com'),
  ('Mendoza', 'Paula', 'F', '1999-06-09', 'Calle 789, Colonia O', 3, 1, NULL, '555-6543', 'paula@example.com'),
  ('Castillo', 'Ricardo', 'M', '1980-05-23', 'Av. Grande, Barrio P', 1, 2, '555-7890', '555-5670', 'ricardo@example.com'),
  ('Ortega', 'Camila', 'F', '2003-04-16', 'Calle 567, Colonia Q', 2, 3, '555-8901', NULL, 'camila@example.com'),
  ('Santos', 'Mateo', 'M', '1976-03-01', 'Av. Pequeña, Barrio R', 3, 1, NULL, '555-1234', 'mateo@example.com'),
  ('Vargas', 'Lucía', 'F', '1997-02-12', 'Calle 890, Colonia S', 1, 2, '555-2345', '555-6543', 'lucia@example.com'),
  ('Cruz', 'Emilio', 'M', '1984-01-26', 'Av. Central, Barrio T', 2, 3, '555-5678', NULL, 'emilio@example.com'),
  ('Luna', 'Renata', 'F', '2004-08-11', 'Calle 123, Colonia U', 3, 1, NULL, '555-8901', 'renata@example.com');
