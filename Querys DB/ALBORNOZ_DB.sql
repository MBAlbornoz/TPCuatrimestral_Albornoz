USE master
GO
DROP DATABASE ALBORNOZ_DB
GO
CREATE DATABASE ALBORNOZ_DB
GO
use ALBORNOZ_DB
GO

CREATE TABLE Telefonos
(
	id int not null primary key identity(1,1),
	tipo varchar(30) not null,
	numero int not null,
)
GO
CREATE TABLE Emails
(
	id int not null primary key identity(1,1),
	email varchar(100) null 
)
GO
CREATE TABLE Direcciones(
	id int not null primary key identity(1,1),
	direccion varchar(200) null,
	numero int null,
	departamento int null,
	ciudad varchar(100) null,
	provincia varchar(100) null,
	pais varchar(100) null
	--idCiudad int null foreign key references Ciudades(id)
)
GO
CREATE TABLE Usuarios
(
	   id int not null primary key,
	   nombre varchar(100) not null,
	   contrasenia varchar(100) not null
)
GO
CREATE TABLE Vendedores
(
	id int not null primary key identity(1,1),
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	dni_cuit int not null unique,
	imagen varchar(500) null,
	fNacimiento Date not null,
	fRegistro Datetime not null,
	sexo char null,
	idUsuario int null foreign key references Usuarios(id),
	idDireccion int not null foreign key references Direcciones(id),
	idTelefono int not null foreign key references Telefonos(id),
	idEmail int not null foreign key references Emails(id)
)
go
CREATE TABLE Clientes
(
	id int not null primary key identity(1,1),
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	dni_cuit int not null unique,
	imagen varchar(500),
	sexo char null,
	fechaNacimiento Date not null,
	fechaRegistro Datetime not null,
	idDireccion int null foreign key references Direcciones(id),
	idTelefono int null foreign key references Telefonos(id),
	idEmail int null foreign key references Emails(id)
)
GO
CREATE TABLE Empresas
(
	id int not null primary key identity(1,1),
	nombre varchar(50) not null,
	cuit int not null unique,
	imagen varchar(500),
    razonSocial varchar(100) not null unique,
    idDireccion int not null foreign key references Direcciones(id),
    idTelefono int not null foreign key references Telefonos(id),
	idEmail int not null foreign key references Emails(id)
)
GO
CREATE TABLE Proveedores
(
	id int not null primary key identity(1,1),
	nombre varchar(50) not null,
	apellido varchar(50) null,
	dni_cuit int not null unique,
	imagen varchar(500)null,
	idDireccion int not null foreign key references Direcciones(id),
	idTelefono int not null foreign key references Telefonos(id),
	idEmail int null foreign key references Emails(id)
)
GO

CREATE TABLE Marcas(
	id int not null primary key identity(1,1),
	nombre varchar(50) not null unique
)
GO       
CREATE TABLE Productos(
	codigo varchar(10) not null primary key,
	nombre varchar(50) not null,
	imagen varchar(100) not null,
	idMarca int not null foreign key references Marcas(id)
)
GO
CREATE TABLE Stock(
	codigoProduct varchar(10) not null foreign key references Productos(codigo),
	minimo int not null,
	maximo int null,
	primary key(codigoProduct)	
)
GO

CREATE TABLE Tipo_Factura(
	id int not null primary key identity(1,1),
	tipo varchar(50) not null
)
GO
CREATE TABLE  MedioPago(
	id int not null primary key identity (1,1),
	medio varchar(100) not null
)
GO
CREATE TABLE Compras(
	codigo int not null primary key identity(1,1),  --codigo del recibo
	idTipoFactura int not null foreign key references Tipo_Factura(id),
	idMedioPago int not null foreign key references MedioPago(id),
	idEmpresa int not null foreign key references EmpresaS(id),
	idProveedor int not null foreign key references Proveedores(id),
	fecha datetime not null,
	total money not null,
	subtotal money not null,
	nota varchar(100) null,
	idDetalleCompra int not null,

)
GO        
CREATE TABLE DetallesCompras(
	id int not null,
	--id int not null identity(1,1),
	codigo int not null foreign key references Compras(codigo),
	codigoProducto varchar(10) not null foreign key references Productos(codigo), 
	precioU money not null,
	cantidad int not null check (cantidad>0), 
	total money not null,
	subtotal money not null,
	iva float null,
	primary key (id,codigo)
)
GO
CREATE TABLE Facturacion(
	codigo int not null primary key identity(1,1),
	idTipoFactura int not null foreign key references Tipo_Factura(id),
	idMedioPago int not null foreign key references MedioPago(id),
	idCliente int not null foreign key references Clientes(id),
	idVendedor int not null foreign key references Vendedores(id),
	fecha DateTime not null,
	total money not null,
	subtotal money not null,
	nota varchar(100) null,
	idVenta int not null,
	CHECK(subtotal>0),
	CHECK(total>0)
)
GO
CREATE TABLE DetalleFacturacion(
		id int not null,
		codigo int not null foreign key references Facturacion(codigo),
		idProducto varchar(10) not null foreign key references Productos(codigo),
		precioU money not null,
		cantidad int not null CHECK(cantidad>0), --CREAR CHECK MAYOR CERO
		total money not null CHECK(total>0),
		subtotal money not null CHECK(subtotal>0),
		iva float null,
		primary key(id,codigo)	
)
GO



-- REGISTROS GENERADOS CLIENTES
INSERT INTO Clientes (Nombre, Apellido,Dni_cuit, Imagen, Sexo,FechaNacimiento, FechaRegistro, IdDireccion, IdTelefono, IdEmail) VALUES (@Nombre,@Apellido,@Dni_cuit,@Imagen,@Sexo,@FechaNacimiento,@FechaRegistro,@IdDireccion,@IdTelefono,@IdEmail)
GO

INSERT INTO Clientes (Nombre, Apellido,Dni_cuit, Imagen, Sexo,FechaNacimiento, FechaRegistro, IdDireccion, IdTelefono, IdEmail)
     VALUES ('Magali','Albornoz',38285688,null,'F','09-04-1994',GETDATE(),null,null,null)
GO
INSERT INTO Telefonos(tipo,numero)VALUES('casa',08001112222)
GO
UPDATE Clientes set IdTelefono=1 where id=1
GO
INSERT INTO Direcciones(direccion, numero,departamento,ciudad,provincia,pais)values('Otra',123,null,'San Isidro','Bs As','Argentina')
GO
UPDATE Clientes set idDireccion=1 where id=1
GO
INSERT INTO Emails(email) VALUES('albornoz.magali@gmail.com')

SELECT * FROM Clientes
GO
SELECT *FROM Direcciones
GO
SELECT * FROM Emails
GO
SELECT * FROM Telefonos

Select c.nombre,c.apellido,c.dni_cuit,c.imagen,c.sexo,c.fechaNacimiento,c.fechaRegistro,d.direccion, d.numero, d.departamento,d.ciudad,d.provincia,d.pais, e.email,t.numero from Clientes as c left join Direcciones as d on c.id=d.id left join Emails as e on c.id=e.id left join Telefonos as t on c.id=t.id

