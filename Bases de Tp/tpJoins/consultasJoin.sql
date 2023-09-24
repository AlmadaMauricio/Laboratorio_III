Use MercadoLabo
Go
/* 1) Por cada tarjeta obtener el número, la fecha de emisión, el nombre del banco y la
marca de la tarjeta. Incluir al listado la cantidad de días restantes para el
vencimiento de la tarjeta.*/
Select T.Numero, T.FechaEmision, B.Nombre, MT.Marca, Datediff(Day, T.FechaVencimiento, Getdate()) As Dias_Restantes  From Tarjetas As T
Inner Join Bancos As B On T.ID_Banco = B.ID_Banco
Inner Join MarcasTarjeta As MT On T.ID_MarcaTarjeta = MT.ID_MarcaTarjeta

/* 2) Por cada usuario indicar Apellidos, Nombres, Edad, Alias de la billetera, la
antigüedad de la billetera en días y el saldo de la misma.*/
Select U.Apellidos, U.Nombres, Year(Getdate()) - Year(U.FechaNacimiento) - Case
When Month(Getdate()) > Month(U.FechaNacimiento) Then 0
When Month(Getdate()) = Month(U.FechaNacimiento) And Day(Getdate()) >= Day(U.FechaNacimiento) Then 0
Else 1
End As Edad, B.Alias, Datediff(Day, B.FechaCreacion, Getdate()) As AntiguedadBilletera, B.Saldo
From Usuarios U
Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario

Select * From Billeteras

/* 3) Por cada usuario indicar Apellidos, Nombre y una categorización a partir del saldo
de la billetera. La categorización es:
- 'Gold' → Más de un millón de pesos
- 'Silver' → Más de 500 mil y hasta un millón de pesos
- 'Bronze' → Entre 50 mil y 500 mil
- 'Copper' → Menos de 50 mil */

Select U.Apellidos, U.Nombres, B.Saldo,
Case
    When B.Saldo > 1000000 Then 'Gold'
    When B.Saldo > 500.000 And B.Saldo <= 1000000 Then 'Silver'
    When B.Saldo >= 50.000 And B.Saldo <= 500000 Then 'Bronze'
    Else 'Copper'
End As Categorizacion
From Usuarios u
Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario

/* 4) Por cada usuario indicar apellidos, nombres, domicilio, nombre de la localidad y
provincia.*/
Select U.Apellidos, U.Nombres, U.Domicilio, L.Localidad, P.Provincia
From Usuarios U 
Inner Join  Localidades L On U.ID_Localidad = L.ID_Localidad
Inner Join Provincias P On L.ID_Provincia = P.ID_Provincia

/* 5) Listar los usuarios con nivel de situación crediticia Excelente y que residan en
Buenos Aires.*/
Select * From Usuarios
Inner Join NivelesSituacionCrediticia On Usuarios.ID_SituacionCrediticia = ID_NivelSituacionCrediticia
Inner Join Localidades L On Usuarios.ID_Localidad = L.ID_Localidad
Inner Join Provincias P On l.ID_Provincia = P.ID_Provincia
Where NivelesSituacionCrediticia.SituacionCrediticia = 'Excelente'
And P.Provincia = 'Buenos aires'

/* 6) Listar los nombres, apellidos y celulares de los usuarios que residan en Córdoba.*/
Select U.Nombres, U.Apellidos, U.Celular From Usuarios U
Inner Join Localidades L On U.ID_Localidad = L.ID_Localidad
Inner Join Provincias P On L.ID_Provincia = P.ID_Provincia
Where P.Provincia = 'Cordoba'

/* 7) Listar los nombres y apellidos de los clientes que no posean tarjeta.*/
Select U.Nombres, U.Apellidos From Usuarios U
Inner Join Billeteras B On U.ID_Usuario = B.ID_Usuario
Inner Join Tarjetas T On B.ID_Billetera = T.ID_Tarjeta
Where T.ID_Tarjeta is Null

/* 8) Listar los nombres, apellidos, alias de billetera, nombres de tarjetas y bancos de
todos los usuarios. Si el usuario no tiene tarjetas debe figurar igualmente en el
listado.*/
Select U.Nombres, U.Apellidos, Bi.Alias, Mt.Marca, Ba.Nombre From Usuarios U
Left Join Billeteras Bi On U.ID_Usuario = Bi.ID_Usuario
Left Join Tarjetas T On Bi.ID_Billetera = T.ID_Billetera
Left Join Bancos Ba On T.ID_Banco = Ba.ID_Banco
Left Join MarcasTarjeta Mt On T.ID_MarcaTarjeta = Mt.ID_MarcaTarjeta

/* 9) Listar nombres y apellidos del usuario que tenga la tarjeta que más tiempo le falte para que
llegue a su vencimiento.*/
Select U.Nombres, U.Apellidos From Usuarios U
Inner Join Billeteras Bi On U.ID_Usuario = Bi.ID_Usuario
Inner Join Tarjetas T On Bi.ID_Billetera = T.ID_Billetera
Where T.FechaVencimiento = (Select Min(T.FechaVencimiento) As FechaVencimiento From Tarjetas T)

/* 10) Listar las distintas marcas de tarjeta, sin repetir, de los usuarios.*/
Select Distinct M.Marca From Usuarios U
Inner Join Billeteras Bi On U.ID_Usuario = Bi.ID_Usuario
Inner Join Tarjetas T On Bi.ID_Billetera = T.ID_Billetera
Inner Join MarcasTarjeta M On T.ID_MarcaTarjeta = M.ID_MarcaTarjeta

/* 11) Listar todos los datos de los usuarios que tengan una situación crediticia diferente
de 'Excelente', 'Regular' y 'No confiable'.*/
Select * From Usuarios
Inner Join NivelesSituacionCrediticia N On Usuarios.ID_SituacionCrediticia = N.ID_NivelSituacionCrediticia
Where N.SituacionCrediticia = 'Muy Buena' And N.SituacionCrediticia = 'Buena' And  N.SituacionCrediticia = 'Mala'
And N.SituacionCrediticia = 'Muy Mala'

Select * From Usuarios U
Inner Join NivelesSituacionCrediticia N On U.ID_SituacionCrediticia = N.ID_NivelSituacionCrediticia
Where N.SituacionCrediticia Not In ('Excelente', 'Regular', 'No confiable')




