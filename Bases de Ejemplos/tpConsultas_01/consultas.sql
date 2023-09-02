Use ActividadUsuarios
Go
-- 1) Apellido, nombres y fecha de nacimiento de todos los usuarios.
Select Apellidos, Nombres, FechaNacimiento From Usuarios

-- 2) Apellido, nombres y edad de todos los usuarios
Select Apellidos, Nombres, Datediff(Year, FechaNacimiento, Getdate())
As Edad From Usuarios

-- 3) Apellido y nombres de aquellos colaboradores cuyo género no sea masculino (letra 'M').
Select Apellidos, Nombres From Usuarios
Where Not Genero = 'M'

-- 4) Todos los datos de los usuarios que hayan 
-- nacido en el primer semestre (indistintamente de qué año fue).
Select * From Usuarios 
Where Month(FechaNacimiento) < 7

-- 5) Apellidos, nombres y DNI  de aquellos usuarios cuya 
-- situación crediticia sea 1, 3 o 5.
Select Apellidos, Nombres, ID_SituacionCrediticia From Usuarios
Where ID_SituacionCrediticia = 1 Or ID_SituacionCrediticia = 3 Or ID_SituacionCrediticia = 5

-- 6) Todos los datos de los usuarios que hayan nacido entre 
-- los años 1990 y 1995 (ambos inclusive) o 2000 y 2005 (ambos inclusive)
Select * From Usuarios
where Year(FechaNacimiento) Between 1990 And 1995 Or 
Year(FechaNacimiento) Between 2000 And 2005

-- 7) Apellidos y nombres concatenados en una misma columna llamada "Apenom" y el teléfono, celular y mail. 
-- Si no tiene teléfono o celular modificar el valor NULL por el texto "No tiene".
Select Apellidos + ', ' + Nombres As Apenom, Telefono, Celular, Mail From Usuarios
Update Usuarios Set Telefono = 'No tiene', Celular = 'No tiene' Where Telefono = Null And Celular = Null

-- 8) Todos los datos de todos los usuarios que tengan celular pero no teléfono.
Select * From Usuarios
Where Celular Is Not Null and Telefono Is Null

-- 9) Apellidos y nombres de los usuarios y una columna llamada Contacto. En ella debe figurar primero el celular, 
-- si el usuario no tiene celular, debe figurar el teléfono y si el usuario no tiene teléfono debe figurar el mail.
Select U.Apellidos, U.Nombres,
Case 
    When U.Celular Is Not Null Then U.Celular
    When U.Telefono Is Not Null Then U.Telefono
    Else U.Mail
End As Contacto
From Usuarios U

-- 10) Apellidos y nombres de los usuarios y una columna llamada FormaContacto.
-- En ella debe figurar "Celular" si el usuario tiene celular, si el usuario no tiene celular, 
-- debe figurar el "Teléfono" si el usuario tiene teléfono, de lo contrario debe figurar "Mail".
Select U.Apellidos, U.Nombres,
Case
    When U.Celular Is Not Null Then 'CELULAR'
    When U.Celular Is Null And U.Telefono Is Not Null Then 'TELEFONO'
    Else 'MAIL'
End As FormaContacto
From Usuarios U

-- 11) Los ID_Localidad, sin repeticiones, de los usuarios
Select Distinct ID_Localidad From Usuarios 

-- 12) Todos los datos de los usuarios que tengan en un su nombre la letra 'A' o la letra 'O'.
Select * From Usuarios
Where Nombres Like '%A%' Or Nombres Like '%O%'

-- 13) Todos los datos de los usuarios que tengan un mail con subdominio ".org"
Select * From Usuarios
Where Mail Like '%.org'

-- 14) Todos los datos de los usuarios que hayan nacido un martes
Select * From Usuarios
Where Datepart(Weekday, FechaNacimiento) = 3

-- 15) Todos los datos de los usuarios que no hayan nacido martes, jueves ni domingo.
Select * From Usuarios
Where Datepart(Weekday, FechaNacimiento) Not in (2, 4, 7)
