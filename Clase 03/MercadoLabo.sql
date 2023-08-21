Create Database MercadoLabo
go
Use MercadoLabo
go
Create Table Provincias(
    ID_Provincia tinyint not null primary key identity (1, 1),
    Provincia varchar(50) not null
)
go
Create Table Localidades(
    ID_Localidad int not null primary key identity (1, 1),
    ID_Provincia tinyint not null foreign key references Provincias(ID_Provincia),
    Localidad varchar(200) not null
)
go
Create Table Bancos(
    ID_Banco smallint not null primary key identity (1, 1),
    Nombre varchar(100) not null
)
go
Create Table NivelesSituacionCrediticia(
    ID_NivelSituacionCrediticia tinyint not null primary key identity (1, 1),
    SituacionCrediticia varchar(50) not null
)
go
Create Table MarcasTarjetas(
    ID_MarcaTarjeta tinyint not null primary key identity (1, 1),
    Marca varchar(100) not null
)
go
Create Table Usuarios(
    ID_Usuario bigint not null primary key identity (1, 1),
    DNI varchar(10) not null unique,
    Apellidos varchar(200) not null,
    Nombres varchar(200) not null,
    FechaNacimiento date not null check (FechaNacimiento <= getdate()),
    Genero char not null,
    ID_SituacionCrediticia tinyint foreign key references NivelesSituacionCrediticia(ID_NivelSituacionCrediticia),
    Telefono varchar(20) null,
    Celular varchar(20) null,
    Mail varchar(200) not null unique,
    Domicilio varchar(500) not null,
    ID_Localidad int not null foreign key references Localidades(ID_Localidad)
)
go
Create Table Billeteras(
    ID_Billetera bigint not null primary key identity (10001, 1),
    ID_Usuario bigint not null unique foreign key references Usuarios(ID_Usuario),
    Alias varchar(30) not null unique, 
    Fcreacion date not null,
    Saldo money not null default(0)
)
go
Create Table Tarjetas(
    ID_Tarjeta bigint not null primary key identity (1, 1), 
    ID_MarcaTarjeta tinyint not null foreign key references MarcasTarjetas(ID_MarcaTarjeta), 
    ID_Banco smallint not null foreign key references Bancos(ID_Banco),
    Numero varchar(16) not null check(LEN(Trim(LTrim(Numero))) = 16),
    FechaEmision date not null,
    FechaVencimiento date not null,
    CodigoSeguridad varchar(4) not null,
    check (FechaEmision < FechaVencimiento)
)
Alter Table Tarjetas
Add ID_Billetera bigint not null foreign key references Billeteras(ID_Billetera)
go