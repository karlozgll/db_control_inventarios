-- CREACIÓN DE BASE DE DATOS
CREATE DATABASE db_control_inventarios;
USE db_control_inventarios;

-- TABLA PRODUCTO
CREATE TABLE [producto] (
	[cod_producto] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nombre] nvarchar(100) NOT NULL UNIQUE,
	[descripcion] nvarchar(250) NOT NULL,
	[unidad_medida] nvarchar(20) NOT NULL,
	[precio_venta] decimal(18,0) NOT NULL,
	[stock_actual] int NOT NULL,
	[stock_minimo] int NOT NULL,
	PRIMARY KEY ([cod_producto])
);
EXEC sp_help producto;

-- TABLA PROVEEDOR
CREATE TABLE [proveedor] (
	[cod_proveedor] int IDENTITY(1,1) NOT NULL UNIQUE,
	[ruc] nvarchar(11) NOT NULL UNIQUE,
	[razon_social] nvarchar(200) NOT NULL UNIQUE,
	[direccion] nvarchar(250) NOT NULL UNIQUE,
	[telefono] nvarchar(20) NOT NULL UNIQUE,
	[email] nvarchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ([cod_proveedor])
);

-- TABLA USUARIO
CREATE TABLE [usuario] (
	[cod_usuario] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nombre_completo] nvarchar(200) NOT NULL UNIQUE,
	[cargo] nvarchar(50) NOT NULL,
	[email] nvarchar(100) NOT NULL UNIQUE,
	[telefono] nvarchar(20) NOT NULL UNIQUE,
	[usuario_login] nvarchar(30) NOT NULL UNIQUE,
	[clave] nvarchar(50) NOT NULL UNIQUE,
	PRIMARY KEY ([cod_usuario])
);

-- TABLA COMPRA
CREATE TABLE [compra] (
	[cod_compra] int IDENTITY(1,1) NOT NULL UNIQUE,
	[cod_proveedor] int NOT NULL,
	[cod_usuario] int NOT NULL,
	[fecha_compra] date NOT NULL,
	[tipo_comprobante] nvarchar(20) NOT NULL,
	[nro_comprobante] nvarchar(30) NOT NULL,
	PRIMARY KEY ([cod_compra])
);

ALTER TABLE [compra] ADD CONSTRAINT [compra_fk1] FOREIGN KEY ([cod_proveedor]) REFERENCES [proveedor]([cod_proveedor]);
ALTER TABLE [compra] ADD CONSTRAINT [compra_fk2] FOREIGN KEY ([cod_usuario]) REFERENCES [usuario]([cod_usuario]);

-- TABLA DETALLE_COMPRA
CREATE TABLE [detalle_compra] (
	[cod_detalle_compra] int IDENTITY(1,1) NOT NULL UNIQUE,
	[cod_compra] int NOT NULL,
	[cod_producto] int NOT NULL,
	[cantidad] int NOT NULL,
	[precio_unitario] decimal(18,0) NOT NULL,
	PRIMARY KEY ([cod_detalle_compra])
);

ALTER TABLE [detalle_compra] ADD CONSTRAINT [detalle_compra_fk1] FOREIGN KEY ([cod_compra]) REFERENCES [compra]([cod_compra]);
ALTER TABLE [detalle_compra] ADD CONSTRAINT [detalle_compra_fk2] FOREIGN KEY ([cod_producto]) REFERENCES [producto]([cod_producto]);

-- TABLA CLIENTE
CREATE TABLE [cliente] (
	[cod_cliente] int IDENTITY(1,1) NOT NULL UNIQUE,
	[tipo_cliente] nvarchar(20) NOT NULL,
	[nombre_razon_social] nvarchar(200) NOT NULL UNIQUE,
	[documento] nvarchar(15) NOT NULL UNIQUE,
	[telefono] nvarchar(20) NOT NULL UNIQUE,
	[email] nvarchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ([cod_cliente])
);

-- TABLA VENTA
CREATE TABLE [venta] (
	[cod_venta] int IDENTITY(1,1) NOT NULL UNIQUE,
	[cod_cliente] int NOT NULL,
	[cod_usuario] int NOT NULL,
	[fecha_venta] date NOT NULL,
	[tipo_comprobante] nvarchar(20) NOT NULL,
	[nro_comprobante] nvarchar(30) NOT NULL,
	PRIMARY KEY ([cod_venta])
);

ALTER TABLE [venta] ADD CONSTRAINT [venta_fk1] FOREIGN KEY ([cod_cliente]) REFERENCES [cliente]([cod_cliente]);
ALTER TABLE [venta] ADD CONSTRAINT [venta_fk2] FOREIGN KEY ([cod_usuario]) REFERENCES [usuario]([cod_usuario]);

-- TABLA DETALLE_VENTA
CREATE TABLE [detalle_venta] (
	[cod_detalle_venta] int IDENTITY(1,1) NOT NULL UNIQUE,
	[cod_venta] int NOT NULL,
	[cod_producto] int NOT NULL,
	[cantidad] int NOT NULL,
	[precio_unitario] decimal(18,0) NOT NULL,
	PRIMARY KEY ([cod_detalle_venta])
);

ALTER TABLE [detalle_venta] ADD CONSTRAINT [detalle_venta_fk1] FOREIGN KEY ([cod_venta]) REFERENCES [venta]([cod_venta]);
ALTER TABLE [detalle_venta] ADD CONSTRAINT [detalle_venta_fk2] FOREIGN KEY ([cod_producto]) REFERENCES [producto]([cod_producto]);

-- TABLA MOVIMIENTO_INVENTARIO
CREATE TABLE [movimiento_inventario] (
	[cod_movimiento] int IDENTITY(1,1) NOT NULL UNIQUE,
	[cod_producto] int NOT NULL,
	[cod_usuario] int NOT NULL,
	[tipo_movimiento] nvarchar(20) NOT NULL,
	[fecha] date NOT NULL,
	[cantidad] int NOT NULL,
	[motivo] nvarchar(200) NOT NULL,
	PRIMARY KEY ([cod_movimiento])
);

ALTER TABLE [movimiento_inventario] ADD CONSTRAINT [movimiento_inventario_fk1] FOREIGN KEY ([cod_producto]) REFERENCES [producto]([cod_producto]);
ALTER TABLE [movimiento_inventario] ADD CONSTRAINT [movimiento_inventario_fk2] FOREIGN KEY ([cod_usuario]) REFERENCES [usuario]([cod_usuario]);