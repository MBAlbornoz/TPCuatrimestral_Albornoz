
--DATOS PERSONALES CLIENTE
CREATE VIEW DPersonalCliente
as
Select c.id as idCliente, p.Nombre, p.Apellido, p.Dni_cuit, p.Imagen, c.fechaNacimiento, c.fechaRegistro  
from Personas as p
inner join Clientes as c on c.idPersona=p.id


--DATOS DE CONTACTO CLIENTE
CREATE VIEW ContactoCliente
as
SELECT d.direccion + d.numero as 'Direccion', d.Departamento,d.Ciudad, d.Provincia,d.Pais, e.Email, t.numero, c.id FROM Direcciones AS d
inner Join Clientes  as c on d.id=c.id
inner Join Emails as e on e.id=c.id
inner Join Telefonos as t on t.id=c.id


--Vista con todos los datos del cliente

CREATE VIEW DATOS_CLIENTE
AS
SELECT d.Nombre, d.Apellido, d.Dni_cuit, d.Imagen, d.FechaNacimiento, d.FechaRegistro, c.Direccion, c.Departamento,
c.Ciudad, c.Provincia,c.Pais,c.Email,c.Numero from DPersonalCliente as d inner join ContactoCliente as c on d.idCliente=c.id

