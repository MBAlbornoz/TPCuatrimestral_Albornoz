CREATE TRIGGER TR_Telefonos ON Telefonos
INSTEAD OF INSERT
AS
--REVISAR

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ID INT
			DECLARE @TIPO VARCHAR(30)
			DECLARE @NUMERO INT
			
			--REGISTRO CLIENTE, ACCEDO A LOS DATOS A INSERTAR
			
			SELECT @ID = ID ,@TIPO = TIPO , @NUMERO = NUMERO FROM INSERTED
			INSERT INTO [ALBORNOZ_DB].[dbo].[Telefonos]([id],[tipo],[numero])
			VALUES(@ID = ID, @TIPO = TIPO, @NUMERO = NUMERO)

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END


