USE [db_control_inventarios]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 02/08/2025 16:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[cod_cliente] [int] IDENTITY(1,1) NOT NULL,
	[tipo_cliente] [nvarchar](20) NOT NULL,
	[nombre_razon_social] [nvarchar](200) NOT NULL,
	[documento] [nvarchar](15) NOT NULL,
	[telefono] [nvarchar](20) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 02/08/2025 16:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[cod_compra] [int] IDENTITY(1,1) NOT NULL,
	[cod_proveedor] [int] NOT NULL,
	[cod_usuario] [int] NOT NULL,
	[fecha_compra] [date] NOT NULL,
	[tipo_comprobante] [nvarchar](20) NOT NULL,
	[nro_comprobante] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_compra]    Script Date: 02/08/2025 16:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_compra](
	[cod_detalle_compra] [int] IDENTITY(1,1) NOT NULL,
	[cod_compra] [int] NOT NULL,
	[cod_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_unitario] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_detalle_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_venta]    Script Date: 02/08/2025 16:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_venta](
	[cod_detalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[cod_venta] [int] NOT NULL,
	[cod_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_unitario] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_detalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimiento_inventario]    Script Date: 02/08/2025 16:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_inventario](
	[cod_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[cod_producto] [int] NOT NULL,
	[cod_usuario] [int] NOT NULL,
	[tipo_movimiento] [nvarchar](20) NOT NULL,
	[fecha] [date] NOT NULL,
	[cantidad] [int] NOT NULL,
	[motivo] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 02/08/2025 16:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[cod_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](250) NOT NULL,
	[unidad_medida] [nvarchar](20) NOT NULL,
	[precio_venta] [decimal](18, 0) NOT NULL,
	[stock_actual] [int] NOT NULL,
	[stock_minimo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 02/08/2025 16:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[cod_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[ruc] [nvarchar](11) NOT NULL,
	[razon_social] [nvarchar](200) NOT NULL,
	[direccion] [nvarchar](250) NOT NULL,
	[telefono] [nvarchar](20) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 02/08/2025 16:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[cod_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre_completo] [nvarchar](200) NOT NULL,
	[cargo] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[telefono] [nvarchar](20) NOT NULL,
	[usuario_login] [nvarchar](30) NOT NULL,
	[clave] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 02/08/2025 16:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[cod_venta] [int] IDENTITY(1,1) NOT NULL,
	[cod_cliente] [int] NOT NULL,
	[cod_usuario] [int] NOT NULL,
	[fecha_venta] [date] NOT NULL,
	[tipo_comprobante] [nvarchar](20) NOT NULL,
	[nro_comprobante] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (1, N'Natural', N'Carlos Mendoza', N'72145896', N'998877665', N'carlos.m@gmail.com')
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (2, N'Jurídico', N'Distribuciones Elite SAC', N'20514789630', N'986745231', N'contacto@elite.com')
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (3, N'Natural', N'Ana María Rojas', N'45896321', N'997766554', N'anarojas@hotmail.com')
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (4, N'Jurídico', N'Inversiones Norte SAC', N'20459874120', N'978654123', N'ventas@norte.com')
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (5, N'Natural', N'Julio César Torres', N'76984521', N'976543987', N'jctorres@yahoo.com')
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (6, N'Natural', N'Lucía Fernanda Gutiérrez', N'78451236', N'965478123', N'lucia.g@gmail.com')
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (7, N'Jurídico', N'Comercializadora Andina SAC', N'20587412365', N'987654789', N'info@andinasac.com')
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (8, N'Natural', N'Mario Eduardo Salas', N'74123698', N'912345678', N'mariosalas@hotmail.com')
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (9, N'Jurídico', N'Servicios Globales S.A.C.', N'20698745120', N'934567892', N'contacto@globales.com')
GO
INSERT [dbo].[cliente] ([cod_cliente], [tipo_cliente], [nombre_razon_social], [documento], [telefono], [email]) VALUES (10, N'Natural', N'Sandra Milagros Ruiz', N'75321486', N'976541230', N'sandraruiz@yahoo.com')
GO
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[compra] ON 
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (1, 1, 1, CAST(N'2025-07-01' AS Date), N'Factura', N'F001-000123')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (2, 2, 2, CAST(N'2025-07-05' AS Date), N'Boleta', N'B001-000234')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (3, 3, 1, CAST(N'2025-07-08' AS Date), N'Factura', N'F001-000345')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (4, 4, 3, CAST(N'2025-07-10' AS Date), N'Factura', N'F002-000456')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (5, 5, 2, CAST(N'2025-07-12' AS Date), N'Boleta', N'B002-000567')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (6, 1, 2, CAST(N'2025-07-13' AS Date), N'Factura', N'F001-000124')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (7, 2, 3, CAST(N'2025-07-14' AS Date), N'Boleta', N'B001-000235')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (8, 3, 4, CAST(N'2025-07-15' AS Date), N'Factura', N'F001-000346')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (9, 4, 5, CAST(N'2025-07-16' AS Date), N'Factura', N'F002-000457')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (10, 5, 1, CAST(N'2025-07-17' AS Date), N'Boleta', N'B002-000568')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (11, 6, 2, CAST(N'2025-07-18' AS Date), N'Factura', N'F003-000001')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (12, 7, 3, CAST(N'2025-07-19' AS Date), N'Factura', N'F003-000002')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (13, 8, 4, CAST(N'2025-07-20' AS Date), N'Boleta', N'B003-000003')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (14, 9, 5, CAST(N'2025-07-21' AS Date), N'Factura', N'F003-000004')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (15, 10, 1, CAST(N'2025-07-22' AS Date), N'Factura', N'F003-000005')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (16, 1, 2, CAST(N'2025-07-23' AS Date), N'Boleta', N'B001-000236')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (17, 2, 3, CAST(N'2025-07-24' AS Date), N'Factura', N'F001-000125')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (18, 3, 4, CAST(N'2025-07-25' AS Date), N'Factura', N'F001-000347')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (19, 4, 5, CAST(N'2025-07-26' AS Date), N'Boleta', N'B002-000569')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (20, 5, 1, CAST(N'2025-07-27' AS Date), N'Factura', N'F002-000458')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (21, 6, 2, CAST(N'2025-07-28' AS Date), N'Factura', N'F003-000006')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (22, 7, 3, CAST(N'2025-07-29' AS Date), N'Boleta', N'B003-000004')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (23, 8, 4, CAST(N'2025-07-30' AS Date), N'Factura', N'F003-000007')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (24, 9, 5, CAST(N'2025-07-31' AS Date), N'Factura', N'F003-000008')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (25, 10, 1, CAST(N'2025-08-01' AS Date), N'Boleta', N'B003-000005')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (26, 1, 2, CAST(N'2025-08-02' AS Date), N'Factura', N'F001-000126')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (27, 2, 3, CAST(N'2025-08-03' AS Date), N'Boleta', N'B001-000237')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (28, 3, 4, CAST(N'2025-08-04' AS Date), N'Factura', N'F001-000348')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (29, 4, 5, CAST(N'2025-08-05' AS Date), N'Factura', N'F002-000459')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (30, 5, 1, CAST(N'2025-08-06' AS Date), N'Boleta', N'B002-000570')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (31, 6, 2, CAST(N'2025-08-07' AS Date), N'Factura', N'F003-000009')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (32, 7, 3, CAST(N'2025-08-08' AS Date), N'Factura', N'F003-000010')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (33, 8, 4, CAST(N'2025-08-09' AS Date), N'Boleta', N'B003-000006')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (34, 9, 5, CAST(N'2025-08-10' AS Date), N'Factura', N'F003-000011')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (35, 10, 1, CAST(N'2025-08-11' AS Date), N'Factura', N'F003-000012')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (36, 1, 2, CAST(N'2025-08-12' AS Date), N'Boleta', N'B001-000238')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (37, 2, 3, CAST(N'2025-08-13' AS Date), N'Factura', N'F001-000127')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (38, 3, 4, CAST(N'2025-08-14' AS Date), N'Factura', N'F001-000349')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (39, 4, 5, CAST(N'2025-08-15' AS Date), N'Boleta', N'B002-000571')
GO
INSERT [dbo].[compra] ([cod_compra], [cod_proveedor], [cod_usuario], [fecha_compra], [tipo_comprobante], [nro_comprobante]) VALUES (40, 5, 1, CAST(N'2025-08-16' AS Date), N'Factura', N'F002-000460')
GO
SET IDENTITY_INSERT [dbo].[compra] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_compra] ON 
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (1, 1, 1, 50, CAST(30 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (2, 1, 2, 20, CAST(100 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (3, 2, 3, 10, CAST(420 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (4, 3, 4, 5, CAST(2700 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (5, 4, 5, 100, CAST(20 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (6, 15, 1, 46, CAST(188 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (7, 32, 3, 67, CAST(308 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (8, 27, 3, 51, CAST(203 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (9, 39, 10, 48, CAST(392 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (10, 39, 15, 78, CAST(244 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (11, 17, 15, 13, CAST(73 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (12, 39, 4, 11, CAST(20 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (13, 35, 9, 67, CAST(283 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (14, 3, 1, 43, CAST(59 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (15, 4, 5, 23, CAST(215 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (16, 25, 13, 13, CAST(87 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (17, 22, 12, 55, CAST(342 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (18, 38, 13, 54, CAST(108 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (19, 21, 4, 34, CAST(353 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (20, 22, 3, 56, CAST(337 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (21, 24, 6, 41, CAST(122 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (22, 34, 5, 9, CAST(342 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (23, 19, 6, 66, CAST(319 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (24, 28, 5, 64, CAST(19 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (25, 23, 5, 58, CAST(154 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (26, 4, 9, 99, CAST(86 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (27, 22, 13, 8, CAST(298 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (28, 36, 6, 27, CAST(64 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (29, 6, 3, 62, CAST(99 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (30, 2, 12, 94, CAST(96 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (31, 27, 12, 100, CAST(360 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (32, 20, 5, 97, CAST(283 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (33, 36, 2, 32, CAST(411 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (34, 13, 3, 29, CAST(126 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (35, 27, 10, 37, CAST(156 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (36, 17, 13, 36, CAST(26 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (37, 35, 3, 38, CAST(46 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (38, 3, 2, 73, CAST(165 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (39, 17, 3, 85, CAST(150 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (40, 3, 11, 55, CAST(405 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (41, 3, 15, 10, CAST(192 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (42, 36, 7, 50, CAST(244 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (43, 37, 1, 22, CAST(418 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (44, 34, 7, 20, CAST(388 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (45, 29, 10, 68, CAST(346 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (46, 37, 6, 30, CAST(29 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (47, 6, 12, 70, CAST(132 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (48, 32, 1, 11, CAST(158 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (49, 39, 9, 22, CAST(66 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (50, 31, 12, 57, CAST(109 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (51, 30, 14, 94, CAST(441 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (52, 9, 10, 39, CAST(93 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (53, 10, 10, 10, CAST(131 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (54, 40, 6, 64, CAST(66 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (55, 26, 5, 28, CAST(253 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (56, 25, 4, 90, CAST(317 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (57, 24, 7, 46, CAST(318 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (58, 20, 14, 86, CAST(398 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (59, 2, 1, 53, CAST(242 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (60, 4, 7, 97, CAST(118 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (61, 34, 2, 84, CAST(161 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (62, 28, 9, 7, CAST(261 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (63, 15, 2, 74, CAST(235 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (64, 1, 6, 24, CAST(176 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (65, 32, 10, 94, CAST(433 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (66, 29, 9, 62, CAST(72 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (67, 3, 12, 50, CAST(151 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (68, 37, 14, 11, CAST(77 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (69, 5, 10, 8, CAST(296 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_compra] ([cod_detalle_compra], [cod_compra], [cod_producto], [cantidad], [precio_unitario]) VALUES (70, 25, 7, 65, CAST(331 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[detalle_compra] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_venta] ON 
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (1, 1, 1, 2, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (2, 2, 2, 1, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (3, 3, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (4, 4, 5, 5, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (5, 5, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (6, 6, 1, 3, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (7, 7, 2, 2, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (8, 8, 5, 4, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (9, 9, 3, 2, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (10, 10, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (11, 11, 1, 1, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (12, 12, 2, 1, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (13, 13, 5, 2, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (14, 14, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (15, 15, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (16, 16, 1, 4, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (17, 17, 2, 2, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (18, 18, 5, 5, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (19, 19, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (20, 20, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (21, 21, 1, 2, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (22, 22, 2, 1, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (23, 23, 5, 3, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (24, 24, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (25, 25, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (26, 26, 1, 1, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (27, 27, 2, 3, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (28, 28, 5, 2, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (29, 29, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (30, 30, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (31, 31, 1, 2, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (32, 32, 2, 2, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (33, 33, 5, 4, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (34, 34, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (35, 35, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (36, 36, 1, 3, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (37, 37, 2, 1, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (38, 38, 5, 2, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (39, 39, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (40, 40, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (41, 6, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (42, 7, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (43, 8, 1, 2, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (44, 9, 5, 2, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (45, 10, 2, 1, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (46, 11, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (47, 12, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (48, 13, 1, 1, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (49, 14, 5, 3, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (50, 15, 2, 1, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (51, 16, 3, 2, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (52, 17, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (53, 18, 1, 3, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (54, 19, 5, 1, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (55, 20, 2, 2, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (56, 21, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (57, 22, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (58, 23, 1, 1, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (59, 24, 5, 2, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (60, 25, 2, 1, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (61, 26, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (62, 27, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (63, 28, 1, 2, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (64, 29, 5, 1, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (65, 30, 2, 2, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (66, 31, 3, 2, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (67, 32, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (68, 33, 1, 3, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (69, 34, 5, 2, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (70, 35, 2, 1, CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (71, 36, 3, 1, CAST(450 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (72, 37, 4, 1, CAST(2800 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (73, 38, 1, 1, CAST(35 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (74, 39, 5, 1, CAST(25 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle_venta] ([cod_detalle_venta], [cod_venta], [cod_producto], [cantidad], [precio_unitario]) VALUES (75, 40, 2, 1, CAST(120 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[detalle_venta] OFF
GO
SET IDENTITY_INSERT [dbo].[movimiento_inventario] ON 
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (1, 1, 2, N'Entrada', CAST(N'2025-07-01' AS Date), 50, N'Compra inicial')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (2, 2, 2, N'Entrada', CAST(N'2025-07-01' AS Date), 20, N'Compra inicial')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (3, 3, 2, N'Salida', CAST(N'2025-07-17' AS Date), 1, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (4, 5, 2, N'Salida', CAST(N'2025-07-18' AS Date), 5, N'Venta minorista')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (5, 4, 3, N'Entrada', CAST(N'2025-07-08' AS Date), 5, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (6, 3, 1, N'Entrada', CAST(N'2025-07-03' AS Date), 30, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (7, 6, 4, N'Salida', CAST(N'2025-07-04' AS Date), 5, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (8, 2, 2, N'Entrada', CAST(N'2025-07-05' AS Date), 40, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (9, 9, 3, N'Salida', CAST(N'2025-07-06' AS Date), 3, N'Avería')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (10, 8, 5, N'Entrada', CAST(N'2025-07-07' AS Date), 25, N'Devolución cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (11, 7, 2, N'Salida', CAST(N'2025-07-08' AS Date), 4, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (12, 10, 1, N'Entrada', CAST(N'2025-07-09' AS Date), 50, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (13, 1, 3, N'Salida', CAST(N'2025-07-10' AS Date), 2, N'Donación')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (14, 4, 4, N'Entrada', CAST(N'2025-07-11' AS Date), 10, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (15, 5, 5, N'Salida', CAST(N'2025-07-12' AS Date), 1, N'Ajuste negativo')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (16, 12, 1, N'Entrada', CAST(N'2025-07-13' AS Date), 60, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (17, 11, 2, N'Salida', CAST(N'2025-07-14' AS Date), 6, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (18, 13, 3, N'Entrada', CAST(N'2025-07-15' AS Date), 20, N'Ajuste positivo')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (19, 14, 4, N'Salida', CAST(N'2025-07-16' AS Date), 8, N'Avería')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (20, 15, 5, N'Entrada', CAST(N'2025-07-17' AS Date), 35, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (21, 2, 1, N'Salida', CAST(N'2025-07-18' AS Date), 5, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (22, 6, 2, N'Entrada', CAST(N'2025-07-19' AS Date), 45, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (23, 8, 3, N'Salida', CAST(N'2025-07-20' AS Date), 3, N'Donación')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (24, 9, 4, N'Entrada', CAST(N'2025-07-21' AS Date), 15, N'Devolución cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (25, 10, 5, N'Salida', CAST(N'2025-07-22' AS Date), 2, N'Avería')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (26, 1, 3, N'Entrada', CAST(N'2025-07-23' AS Date), 25, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (27, 12, 2, N'Salida', CAST(N'2025-07-24' AS Date), 1, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (28, 3, 4, N'Entrada', CAST(N'2025-07-25' AS Date), 30, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (29, 7, 1, N'Salida', CAST(N'2025-07-26' AS Date), 2, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (30, 5, 5, N'Entrada', CAST(N'2025-07-27' AS Date), 40, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (31, 4, 3, N'Salida', CAST(N'2025-07-28' AS Date), 5, N'Donación')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (32, 6, 1, N'Entrada', CAST(N'2025-07-29' AS Date), 50, N'Reposición proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (33, 8, 2, N'Salida', CAST(N'2025-07-30' AS Date), 2, N'Venta minorista')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (34, 10, 3, N'Entrada', CAST(N'2025-07-30' AS Date), 20, N'Ajuste positivo')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (35, 11, 4, N'Salida', CAST(N'2025-07-31' AS Date), 3, N'Avería interna')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (36, 13, 5, N'Entrada', CAST(N'2025-08-01' AS Date), 60, N'Compra nuevo proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (37, 9, 1, N'Salida', CAST(N'2025-08-01' AS Date), 1, N'Retiro por donación')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (38, 7, 2, N'Entrada', CAST(N'2025-08-02' AS Date), 35, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (39, 14, 3, N'Salida', CAST(N'2025-08-02' AS Date), 4, N'Venta empresa')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (40, 15, 4, N'Entrada', CAST(N'2025-08-03' AS Date), 45, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (41, 12, 5, N'Salida', CAST(N'2025-08-03' AS Date), 2, N'Pérdida')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (42, 3, 1, N'Entrada', CAST(N'2025-08-04' AS Date), 50, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (43, 4, 2, N'Salida', CAST(N'2025-08-04' AS Date), 2, N'Venta minorista')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (44, 5, 3, N'Entrada', CAST(N'2025-08-05' AS Date), 30, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (45, 1, 4, N'Salida', CAST(N'2025-08-05' AS Date), 3, N'Retiro por personal')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (46, 2, 5, N'Entrada', CAST(N'2025-08-06' AS Date), 60, N'Devolución proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (47, 6, 1, N'Salida', CAST(N'2025-08-06' AS Date), 5, N'Ajuste negativo')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (48, 7, 2, N'Entrada', CAST(N'2025-08-07' AS Date), 25, N'Compra mayorista')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (49, 8, 3, N'Salida', CAST(N'2025-08-07' AS Date), 6, N'Venta minorista')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (50, 9, 4, N'Entrada', CAST(N'2025-08-08' AS Date), 40, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (51, 10, 5, N'Salida', CAST(N'2025-08-08' AS Date), 3, N'Pérdida por daño')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (52, 11, 1, N'Entrada', CAST(N'2025-08-09' AS Date), 55, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (53, 12, 2, N'Salida', CAST(N'2025-08-09' AS Date), 1, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (54, 13, 3, N'Entrada', CAST(N'2025-08-10' AS Date), 35, N'Compra nacional')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (55, 14, 4, N'Salida', CAST(N'2025-08-10' AS Date), 5, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (56, 15, 5, N'Entrada', CAST(N'2025-08-11' AS Date), 30, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (57, 1, 1, N'Salida', CAST(N'2025-08-11' AS Date), 2, N'Donación interna')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (58, 2, 2, N'Entrada', CAST(N'2025-08-12' AS Date), 50, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (59, 3, 3, N'Salida', CAST(N'2025-08-12' AS Date), 1, N'Venta minorista')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (60, 4, 4, N'Entrada', CAST(N'2025-08-13' AS Date), 20, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (61, 5, 5, N'Salida', CAST(N'2025-08-13' AS Date), 4, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (62, 6, 1, N'Entrada', CAST(N'2025-08-14' AS Date), 40, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (63, 7, 2, N'Salida', CAST(N'2025-08-14' AS Date), 2, N'Retiro personal')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (64, 8, 3, N'Entrada', CAST(N'2025-08-15' AS Date), 45, N'Devolución proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (65, 9, 4, N'Salida', CAST(N'2025-08-15' AS Date), 3, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (66, 10, 5, N'Entrada', CAST(N'2025-08-16' AS Date), 30, N'Ajuste positivo')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (67, 11, 1, N'Salida', CAST(N'2025-08-16' AS Date), 6, N'Avería')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (68, 12, 2, N'Entrada', CAST(N'2025-08-17' AS Date), 70, N'Compra internacional')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (69, 13, 3, N'Salida', CAST(N'2025-08-17' AS Date), 2, N'Venta interna')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (70, 14, 4, N'Entrada', CAST(N'2025-08-18' AS Date), 60, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (71, 15, 5, N'Salida', CAST(N'2025-08-18' AS Date), 1, N'Muestra gratuita')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (72, 1, 1, N'Entrada', CAST(N'2025-08-19' AS Date), 80, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (73, 2, 2, N'Salida', CAST(N'2025-08-19' AS Date), 3, N'Retiro interno')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (74, 3, 3, N'Entrada', CAST(N'2025-08-20' AS Date), 40, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (75, 4, 4, N'Salida', CAST(N'2025-08-20' AS Date), 2, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (76, 5, 5, N'Entrada', CAST(N'2025-08-21' AS Date), 55, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (77, 6, 1, N'Salida', CAST(N'2025-08-21' AS Date), 3, N'Donación')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (78, 7, 2, N'Entrada', CAST(N'2025-08-22' AS Date), 60, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (79, 8, 3, N'Salida', CAST(N'2025-08-22' AS Date), 5, N'Venta empresa')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (80, 9, 4, N'Entrada', CAST(N'2025-08-23' AS Date), 50, N'Devolución cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (81, 10, 5, N'Salida', CAST(N'2025-08-23' AS Date), 2, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (82, 11, 1, N'Entrada', CAST(N'2025-08-24' AS Date), 40, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (83, 12, 2, N'Salida', CAST(N'2025-08-24' AS Date), 1, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (84, 13, 3, N'Entrada', CAST(N'2025-08-25' AS Date), 65, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (85, 14, 4, N'Salida', CAST(N'2025-08-25' AS Date), 2, N'Muestra')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (86, 15, 5, N'Entrada', CAST(N'2025-08-26' AS Date), 75, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (87, 1, 1, N'Salida', CAST(N'2025-08-26' AS Date), 3, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (88, 2, 2, N'Entrada', CAST(N'2025-08-27' AS Date), 90, N'Devolución')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (89, 3, 3, N'Salida', CAST(N'2025-08-27' AS Date), 2, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (90, 4, 4, N'Entrada', CAST(N'2025-08-28' AS Date), 35, N'Compra proveedor')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (91, 5, 5, N'Salida', CAST(N'2025-08-28' AS Date), 3, N'Pérdida por daño')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (92, 6, 1, N'Entrada', CAST(N'2025-08-29' AS Date), 45, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (93, 7, 2, N'Salida', CAST(N'2025-08-29' AS Date), 4, N'Venta cliente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (94, 8, 3, N'Entrada', CAST(N'2025-08-30' AS Date), 50, N'Compra nacional')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (95, 9, 4, N'Salida', CAST(N'2025-08-30' AS Date), 1, N'Donación')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (96, 10, 5, N'Entrada', CAST(N'2025-08-31' AS Date), 40, N'Reposición')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (97, 11, 3, N'Salida', CAST(N'2025-09-01' AS Date), 2, N'Venta cliente frecuente')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (98, 12, 4, N'Entrada', CAST(N'2025-09-02' AS Date), 50, N'Reposición por stock bajo')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (99, 13, 5, N'Salida', CAST(N'2025-09-02' AS Date), 3, N'Donación escolar')
GO
INSERT [dbo].[movimiento_inventario] ([cod_movimiento], [cod_producto], [cod_usuario], [tipo_movimiento], [fecha], [cantidad], [motivo]) VALUES (100, 14, 1, N'Entrada', CAST(N'2025-09-03' AS Date), 60, N'Compra mensual')
GO
SET IDENTITY_INSERT [dbo].[movimiento_inventario] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (1, N'Mouse óptico', N'Mouse inalámbrico con sensor óptico', N'unidad', CAST(35 AS Decimal(18, 0)), 100, 10)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (2, N'Teclado mecánico', N'Teclado con retroiluminación RGB', N'unidad', CAST(120 AS Decimal(18, 0)), 50, 5)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (3, N'Monitor 24"', N'Monitor LED de 24 pulgadas Full HD', N'unidad', CAST(450 AS Decimal(18, 0)), 30, 3)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (4, N'Laptop Lenovo', N'Laptop Core i5, 8GB RAM, 256GB SSD', N'unidad', CAST(2800 AS Decimal(18, 0)), 20, 2)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (5, N'Cable HDMI', N'Cable HDMI 1.5 metros', N'unidad', CAST(25 AS Decimal(18, 0)), 150, 20)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (6, N'Webcam HD', N'Cámara web HD 720p con micrófono integrado', N'unidad', CAST(95 AS Decimal(18, 0)), 40, 5)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (7, N'Audífonos Bluetooth', N'Audífonos inalámbricos con micrófono', N'unidad', CAST(150 AS Decimal(18, 0)), 60, 10)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (8, N'Disco Duro Externo 1TB', N'HDD portátil USB 3.0 de 1TB', N'unidad', CAST(220 AS Decimal(18, 0)), 35, 5)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (9, N'Router Wi-Fi', N'Router inalámbrico dual band 1200Mbps', N'unidad', CAST(180 AS Decimal(18, 0)), 25, 3)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (10, N'Impresora Multifuncional', N'Impresora con escáner y copiadora', N'unidad', CAST(520 AS Decimal(18, 0)), 15, 2)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (11, N'Memoria USB 32GB', N'Unidad flash USB 3.0 de 32GB', N'unidad', CAST(45 AS Decimal(18, 0)), 120, 15)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (12, N'Tablet 10"', N'Tablet Android con pantalla HD de 10 pulgadas', N'unidad', CAST(750 AS Decimal(18, 0)), 25, 3)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (13, N'Switch de Red 8 Puertos', N'Switch Ethernet de 8 puertos 10/100/1000', N'unidad', CAST(160 AS Decimal(18, 0)), 20, 5)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (14, N'Cámara de Seguridad IP', N'Cámara de videovigilancia con visión nocturna', N'unidad', CAST(230 AS Decimal(18, 0)), 18, 2)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (15, N'Soporte para Laptop', N'Soporte ajustable de aluminio para laptops', N'unidad', CAST(65 AS Decimal(18, 0)), 55, 8)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (16, N'Fuente de Poder 600W', N'Fuente de alimentación para PC de 600W', N'unidad', CAST(185 AS Decimal(18, 0)), 22, 4)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (17, N'Kit de Limpieza para PC', N'Kit de limpieza con aire comprimido y paños', N'unidad', CAST(35 AS Decimal(18, 0)), 70, 10)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (18, N'Mousepad Gamer', N'Alfombrilla de ratón extendida con base antideslizante', N'unidad', CAST(40 AS Decimal(18, 0)), 85, 10)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (19, N'Cargador Universal', N'Cargador portátil compatible con múltiples dispositivos', N'unidad', CAST(90 AS Decimal(18, 0)), 30, 5)
GO
INSERT [dbo].[producto] ([cod_producto], [nombre], [descripcion], [unidad_medida], [precio_venta], [stock_actual], [stock_minimo]) VALUES (20, N'Parlantes USB', N'Parlantes estéreo para PC con conexión USB', N'unidad', CAST(110 AS Decimal(18, 0)), 28, 3)
GO
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET IDENTITY_INSERT [dbo].[proveedor] ON 
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (1, N'20548796301', N'Importaciones Digital SAC', N'Av. Arequipa 1234, Lima', N'987654321', N'ventas@digital.pe')
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (2, N'20459874123', N'Tech World EIRL', N'Calle Los Robles 567, Piura', N'945672345', N'contacto@techworld.com')
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (3, N'20345678901', N'Soluciones TI S.A.C.', N'Av. Grau 789, Trujillo', N'956321789', N'info@solucionesti.pe')
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (4, N'20765432109', N'Distribuidora Electro S.A.', N'Jr. Tacna 321, Cusco', N'924567843', N'ventas@electro.pe')
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (5, N'20678912345', N'Perú Gadgets SRL', N'Av. Brasil 456, Lima', N'912345678', N'contacto@gadgets.pe')
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (6, N'20511223344', N'InnovaTech S.A.C.', N'Av. Industrial 1001, Arequipa', N'951234567', N'ventas@innovatech.pe')
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (7, N'20443322110', N'RedSys Perú EIRL', N'Calle Comercio 777, Chiclayo', N'968765432', N'contacto@redsys.pe')
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (8, N'20334455667', N'Componentes Globales SAC', N'Jr. Independencia 202, Ica', N'987112233', N'soporte@componentesglobales.com')
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (9, N'20778899001', N'Tecnología Total S.A.', N'Av. Los Próceres 1800, Lima', N'955667788', N'ventas@tecnologiatotal.pe')
GO
INSERT [dbo].[proveedor] ([cod_proveedor], [ruc], [razon_social], [direccion], [telefono], [email]) VALUES (10, N'20661122334', N'DataSource Perú SRL', N'Pasaje Unión 345, Huancayo', N'964321789', N'clientes@datasource.pe')
GO
SET IDENTITY_INSERT [dbo].[proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (1, N'Luis Ramírez Silva', N'Administrador', N'lramirez@empresa.com', N'988776655', N'lramirez', N'12345abc')
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (2, N'Carla Torres Ríos', N'Almacenero', N'ctorres@empresa.com', N'976543210', N'ctorres', N'clave123')
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (3, N'Julio Huamán Cruz', N'Supervisor', N'jhuaman@empresa.com', N'965432178', N'jhuaman', N'abc123')
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (4, N'Diana Paredes López', N'Vendedor', N'dparedes@empresa.com', N'954321765', N'dparedes', N'789xyz')
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (5, N'José Gonzales Ruiz', N'Asistente', N'jgonzales@empresa.com', N'943210987', N'jgonzales', N'pass456')
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (6, N'María Fernanda Quispe', N'Vendedor', N'mquispe@empresa.com', N'987123456', N'mquispe', N'ventas2025')
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (7, N'Carlos Peña Vargas', N'Administrador', N'cpena@empresa.com', N'986654321', N'cpena', N'admin456')
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (8, N'Rosa Medina Torres', N'Almacenero', N'rmedina@empresa.com', N'985432198', N'rmedina', N'almacen789')
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (9, N'Javier Soto León', N'Supervisor', N'jsoto@empresa.com', N'984321987', N'jsoto', N'control123')
GO
INSERT [dbo].[usuario] ([cod_usuario], [nombre_completo], [cargo], [email], [telefono], [usuario_login], [clave]) VALUES (10, N'Angela Rojas Salas', N'Asistente', N'arojas@empresa.com', N'983210876', N'arojas', N'soporte456')
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[venta] ON 
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (1, 1, 4, CAST(N'2025-07-15' AS Date), N'Boleta', N'B001-100001')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (2, 2, 3, CAST(N'2025-07-16' AS Date), N'Factura', N'F001-100002')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (3, 3, 5, CAST(N'2025-07-17' AS Date), N'Boleta', N'B002-100003')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (4, 4, 4, CAST(N'2025-07-18' AS Date), N'Factura', N'F002-100004')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (5, 5, 3, CAST(N'2025-07-19' AS Date), N'Boleta', N'B003-100005')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (6, 2, 1, CAST(N'2025-07-20' AS Date), N'Factura', N'F001-100006')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (7, 5, 3, CAST(N'2025-07-21' AS Date), N'Boleta', N'B001-100007')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (8, 4, 2, CAST(N'2025-07-22' AS Date), N'Boleta', N'B001-100008')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (9, 1, 5, CAST(N'2025-07-23' AS Date), N'Factura', N'F002-100009')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (10, 3, 4, CAST(N'2025-07-24' AS Date), N'Boleta', N'B001-100010')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (11, 6, 2, CAST(N'2025-07-25' AS Date), N'Factura', N'F002-100011')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (12, 2, 6, CAST(N'2025-07-26' AS Date), N'Boleta', N'B002-100012')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (13, 7, 4, CAST(N'2025-07-27' AS Date), N'Boleta', N'B002-100013')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (14, 8, 7, CAST(N'2025-07-28' AS Date), N'Factura', N'F003-100014')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (15, 9, 3, CAST(N'2025-07-29' AS Date), N'Boleta', N'B003-100015')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (16, 10, 1, CAST(N'2025-07-30' AS Date), N'Factura', N'F001-100016')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (17, 6, 5, CAST(N'2025-07-31' AS Date), N'Boleta', N'B003-100017')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (18, 3, 2, CAST(N'2025-08-01' AS Date), N'Factura', N'F004-100018')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (19, 4, 8, CAST(N'2025-08-02' AS Date), N'Boleta', N'B004-100019')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (20, 5, 9, CAST(N'2025-08-03' AS Date), N'Factura', N'F004-100020')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (21, 1, 10, CAST(N'2025-08-04' AS Date), N'Boleta', N'B004-100021')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (22, 7, 6, CAST(N'2025-08-05' AS Date), N'Factura', N'F005-100022')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (23, 8, 5, CAST(N'2025-08-06' AS Date), N'Boleta', N'B005-100023')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (24, 9, 7, CAST(N'2025-08-07' AS Date), N'Factura', N'F005-100024')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (25, 10, 4, CAST(N'2025-08-08' AS Date), N'Boleta', N'B005-100025')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (26, 2, 3, CAST(N'2025-08-09' AS Date), N'Factura', N'F006-100026')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (27, 6, 2, CAST(N'2025-08-10' AS Date), N'Boleta', N'B006-100027')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (28, 3, 1, CAST(N'2025-08-11' AS Date), N'Factura', N'F006-100028')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (29, 4, 10, CAST(N'2025-08-12' AS Date), N'Boleta', N'B006-100029')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (30, 5, 9, CAST(N'2025-08-13' AS Date), N'Factura', N'F007-100030')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (31, 1, 8, CAST(N'2025-08-14' AS Date), N'Boleta', N'B007-100031')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (32, 7, 7, CAST(N'2025-08-15' AS Date), N'Factura', N'F007-100032')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (33, 8, 6, CAST(N'2025-08-16' AS Date), N'Boleta', N'B007-100033')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (34, 9, 5, CAST(N'2025-08-17' AS Date), N'Factura', N'F008-100034')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (35, 10, 4, CAST(N'2025-08-18' AS Date), N'Boleta', N'B008-100035')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (36, 2, 3, CAST(N'2025-08-19' AS Date), N'Factura', N'F008-100036')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (37, 6, 2, CAST(N'2025-08-20' AS Date), N'Boleta', N'B008-100037')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (38, 3, 1, CAST(N'2025-08-21' AS Date), N'Factura', N'F009-100038')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (39, 4, 10, CAST(N'2025-08-22' AS Date), N'Boleta', N'B009-100039')
GO
INSERT [dbo].[venta] ([cod_venta], [cod_cliente], [cod_usuario], [fecha_venta], [tipo_comprobante], [nro_comprobante]) VALUES (40, 5, 9, CAST(N'2025-08-23' AS Date), N'Factura', N'F009-100040')
GO
SET IDENTITY_INSERT [dbo].[venta] OFF
GO
/****** Object:  Index [UQ__cliente__08ED61F2EF26C14B]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__cliente__15EEB686795CB780]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[nombre_razon_social] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__cliente__2A16D94502B7A4AC]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__cliente__A25B3E61182CB167]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__cliente__AB6E616420F2D2DF]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[cliente] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__compra__7666303B88161037]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[compra] ADD UNIQUE NONCLUSTERED 
(
	[cod_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__detalle___91D16D4A714D793F]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[detalle_compra] ADD UNIQUE NONCLUSTERED 
(
	[cod_detalle_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__detalle___C0D8C549E45DA0CC]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[detalle_venta] ADD UNIQUE NONCLUSTERED 
(
	[cod_detalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__movimien__8579D7C93C1B1F4B]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[movimiento_inventario] ADD UNIQUE NONCLUSTERED 
(
	[cod_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__producto__118203ACB03CCD6B]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[producto] ADD UNIQUE NONCLUSTERED 
(
	[cod_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__producto__72AFBCC6E02CEE40]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[producto] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__proveedo__2A16D9451648A36C]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[proveedor] ADD UNIQUE NONCLUSTERED 
(
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__proveedo__636D81AB15DC42BA]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[proveedor] ADD UNIQUE NONCLUSTERED 
(
	[direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__proveedo__7A0ABAB3A0D9019A]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[proveedor] ADD UNIQUE NONCLUSTERED 
(
	[razon_social] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__proveedo__AB6E61641BC1194A]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[proveedor] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__proveedo__C2B74E61A4BC3632]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[proveedor] ADD UNIQUE NONCLUSTERED 
(
	[ruc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__proveedo__D4A662EA478F1E02]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[proveedor] ADD UNIQUE NONCLUSTERED 
(
	[cod_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuario__2A16D945227F1F6E]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[usuario] ADD UNIQUE NONCLUSTERED 
(
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuario__4ADECE1283EC342E]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[usuario] ADD UNIQUE NONCLUSTERED 
(
	[usuario_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuario__71DCA3DB6E90C421]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[usuario] ADD UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuario__AB6E61640F91772D]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[usuario] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__usuario__EA3C9B1B4F774232]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[usuario] ADD UNIQUE NONCLUSTERED 
(
	[cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuario__FE74C6CC5D56C4B7]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[usuario] ADD UNIQUE NONCLUSTERED 
(
	[nombre_completo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__venta__27326094E223E717]    Script Date: 02/08/2025 16:00:30 ******/
ALTER TABLE [dbo].[venta] ADD UNIQUE NONCLUSTERED 
(
	[cod_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [compra_fk1] FOREIGN KEY([cod_proveedor])
REFERENCES [dbo].[proveedor] ([cod_proveedor])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [compra_fk1]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [compra_fk2] FOREIGN KEY([cod_usuario])
REFERENCES [dbo].[usuario] ([cod_usuario])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [compra_fk2]
GO
ALTER TABLE [dbo].[detalle_compra]  WITH CHECK ADD  CONSTRAINT [detalle_compra_fk1] FOREIGN KEY([cod_compra])
REFERENCES [dbo].[compra] ([cod_compra])
GO
ALTER TABLE [dbo].[detalle_compra] CHECK CONSTRAINT [detalle_compra_fk1]
GO
ALTER TABLE [dbo].[detalle_compra]  WITH CHECK ADD  CONSTRAINT [detalle_compra_fk2] FOREIGN KEY([cod_producto])
REFERENCES [dbo].[producto] ([cod_producto])
GO
ALTER TABLE [dbo].[detalle_compra] CHECK CONSTRAINT [detalle_compra_fk2]
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD  CONSTRAINT [detalle_venta_fk1] FOREIGN KEY([cod_venta])
REFERENCES [dbo].[venta] ([cod_venta])
GO
ALTER TABLE [dbo].[detalle_venta] CHECK CONSTRAINT [detalle_venta_fk1]
GO
ALTER TABLE [dbo].[detalle_venta]  WITH CHECK ADD  CONSTRAINT [detalle_venta_fk2] FOREIGN KEY([cod_producto])
REFERENCES [dbo].[producto] ([cod_producto])
GO
ALTER TABLE [dbo].[detalle_venta] CHECK CONSTRAINT [detalle_venta_fk2]
GO
ALTER TABLE [dbo].[movimiento_inventario]  WITH CHECK ADD  CONSTRAINT [movimiento_inventario_fk1] FOREIGN KEY([cod_producto])
REFERENCES [dbo].[producto] ([cod_producto])
GO
ALTER TABLE [dbo].[movimiento_inventario] CHECK CONSTRAINT [movimiento_inventario_fk1]
GO
ALTER TABLE [dbo].[movimiento_inventario]  WITH CHECK ADD  CONSTRAINT [movimiento_inventario_fk2] FOREIGN KEY([cod_usuario])
REFERENCES [dbo].[usuario] ([cod_usuario])
GO
ALTER TABLE [dbo].[movimiento_inventario] CHECK CONSTRAINT [movimiento_inventario_fk2]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [venta_fk1] FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[cliente] ([cod_cliente])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [venta_fk1]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [venta_fk2] FOREIGN KEY([cod_usuario])
REFERENCES [dbo].[usuario] ([cod_usuario])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [venta_fk2]
GO
