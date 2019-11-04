

CREATE TRIGGER TR_ALTA ON Personas
INSTEAD OF INSERT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION	
			DECLARE @NOMBRE VARCHAR(50)
			DECLARE @APELLIDO VARCHAR(50)
			DECLARE @IMAGEN VARCHAR(500)
			DECLARE @DNI_CUIT INT
			DECLARE @ID INT

			--REGISTRO CLIENTE, ACCEDO A LOS DATOS A INSERTAR
			SELECT @ID = ID, @NOMBRE = NOMBRE, @APELLIDO = APELLIDO, @DNI_CUIT = DNI_CUIT, @IMAGEN = IMAGEN FROM INSERTED
			--INSERTA REGISTRO
			INSERT INTO [ALBORNOZ_DB].[dbo].[Personas]([nombre],[apellido],[dni_cuit],[imagen])VALUES(@NOMBRE,@APELLIDO,@DNI_CUIT,@IMAGEN)
			
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END




Select top(1) id from Personas order by id desc

/*
select p.id,p.nombre,p.apellido,p.dni_cuit,c.fechaNacimiento,
(Select d.direccion,d.numero,d.departamento,d.ciudad,d.provincia,d.pais from Direcciones  as d where id=p.id),
e.email,t.numero 
from Clientes as c inner join Personas as p on p.id=c.idPersona
inner join Emails as e on p.id=e.id
inner join Telefonos as t on p.id=t.id
*/

select p.id,p.nombre,p.apellido,p.dni_cuit,c.fechaNacimiento,d.direccion,d.numero,d.departamento,d.ciudad,d.provincia,d.pais,
e.email,t.numero
from Personas as p 
inner  join Clientes as c on p.id=c.idPersona
inner join Direcciones as d on d.id=p.id
inner join Emails as e on e.id=p.id
inner join Telefonos as t on t.id=p.id





delete from Direcciones
go
delete from Telefonos
go
delete from Emails
go
DELETE FROM Clientes
go
delete from Personas



			INSERT INTO [ALBORNOZ_DB].[dbo].[Personas]([nombre],[apellido],[dni_cuit])VALUES('Magali','Albornoz',38285689)
			GO
			INSERT INTO [ALBORNOZ_DB].[dbo].[Direcciones]([id],[direccion],[numero],[departamento],[ciudad],[provincia],[pais])
			VALUES((Select top(1) id from Personas order by id desc),'3 de Febrero',727,'','San Isidro','Buenos Aires','Argentina')
			GO
			INSERT INTO [ALBORNOZ_DB].[dbo].[Emails]([id],[email])
			VALUES((Select top(1) id from Personas order by id desc),'albornoz17.magali@gmail.com')
			GO
			INSERT INTO [ALBORNOZ_DB].[dbo].[Telefonos]([id],[tipo],[numero])
			VALUES((Select top(1) id from Personas order by id desc),'Personal',1560180043)
			GO
			INSERT INTO [ALBORNOZ_DB].[dbo].[Clientes]([idPersona],[fechaNacimiento],[fechaRegistro])
			VALUES((Select top(1) id from Personas order by id desc),'09-04-1994',GETDATE())
	COMMIT TRANSACTION