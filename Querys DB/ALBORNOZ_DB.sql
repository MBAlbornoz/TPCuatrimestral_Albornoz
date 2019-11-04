USE master
GO
DROP DATABASE ALBORNOZ_DB
GO
CREATE DATABASE ALBORNOZ_DB
GO
use ALBORNOZ_DB
GO
CREATE TABLE Personas
(
	id int not null primary key identity(1,1),
	nombre varchar(50) not null,
	apellido varchar(50),
	dni_cuit int not null unique,
	imagen varchar(500),
)
GO
CREATE TABLE Usuarios
(
	   id int not null primary key,
	   nombre varchar(100) not null,
	   contrasenia varchar(100) not null
)
GO
CREATE TABLE Vendedores(
	id int not null primary key identity(1,1),
	idPersona int not null foreign key references Personas(id),
	fNacimiento Date not null,
	fRegistro Datetime not null,
	sexo char null,
	idUsuario int null foreign key references Usuarios(id)
)


GO

CREATE TABLE Clientes(
	id int not null primary key identity(1,1),
	idPersona int not null foreign key references Personas(id),
	fechaNacimiento Date not null,
	fechaRegistro Datetime not null
)
GO

CREATE TABLE Empresa(
	id int not null primary key identity(1,1),
	idPersona int not null foreign key references Personas(id),
	razonSocial varchar(100) not null unique,
)
GO
CREATE TABLE Proveedores(
	id int not null primary key identity(1,1),
	idPersona int not null foreign key references Personas(id)
)
GO
CREATE TABLE Telefonos
(
	id int not null foreign key references Personas(id),
	tipo varchar(30) not null,
	numero int not null,
	primary key(id,tipo)
)
GO
CREATE TABLE Emails
(
	id int not null primary key foreign key references Personas(id),
	email varchar(100) null 
)

/*
CREATE TABLE Paises
(
	id int not null primary key identity(1,1),
	nombre varchar(50) not null  unique,
)
GO
CREATE TABLE Provincias
(
	id int not null primary key identity(1,1),
	idPais int null foreign key references Paises(id),
	nombre varchar(100) not null unique
)
CREATE TABLE Ciudades
(
	id int not null primary key identity(1,1),
	idProvincia int null foreign key references Provincias(id),
	nombre varchar(50) not null
)
*/
        
CREATE TABLE Marcas(
	id int not null primary key identity(1,1),
	nombre varchar(100) not null unique
)

GO       
CREATE TABLE Productos(
	codigo varchar(100) not null primary key,
	nombre varchar(100) not null,
	imagen varchar(200) not null,
	idMarca int not null foreign key references Marcas(id)
)
GO
CREATE TABLE Stock(
	codigoProduct varchar(100) not null foreign key references Productos(codigo),
	minimo int not null,
	maximo int null,
	primary key(codigoProduct)	
)
GO


CREATE TABLE Direcciones(
	id int not null primary key foreign key references Personas(id),
	direccion varchar(200) null,
	numero int null,
	departamento int null,
	ciudad varchar(100) null,
	provincia varchar(100) null,
	pais varchar(100) null
	--idCiudad int null foreign key references Ciudades(id)
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
	codigo int not null primary key identity(1,1),
	idTipoFactura int not null foreign key references Tipo_Factura(id),
	idMedioPago int not null foreign key references MedioPago(id),
	idEmpresa int not null foreign key references Empresa(id),
	idProveedor int not null foreign key references Proveedores(id),
	fecha datetime not null,
	total money not null,
	subtotal money not null,
	nota varchar(100) null,
	idDetalleCompra int not null,

)
GO        
CREATE TABLE DetalleCompras(
	codigo int not null foreign key references Compras(codigo),
	codigoProducto varchar(100) not null foreign key references Productos(codigo), 
	codigoFactura int not null,
	precioU money not null,
	cantidad int not null check (cantidad>0), 
	total money not null,
	subtotal money not null,
	iva float null
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
CREATE TABLE DetalleVentas(
		codigo int not null foreign key references Facturacion(codigo),
		idCodigoFactura int not null,
		idProducto varchar(100) not null foreign key references Productos(codigo),
		codigoFactura int not null,
		precioU money not null,
		cantidad int not null, --CREAR CHECK MAYOR CERO
		total money not null,
		subtotal money not null,
		iva float null
)
GO
<<<<<<< HEAD

=======
>>>>>>> 9c14fa35d66a16579cdc572a00dd8a08edb03e71
