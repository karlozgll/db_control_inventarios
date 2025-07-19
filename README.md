# db_retail_inventarios

CASO PROPUESTO – COMERCIO: CONTROL DE INVENTARIOS
Contexto general
“Comercializadora Santa Rosa” es un negocio que se dedica a la venta de productos de limpieza al por mayor y menor. Tiene un almacén principal donde gestiona su inventario, realizando entradas por compras y salidas por ventas o consumo interno. El negocio desea implementar un sistema que permita tener el control exacto de su inventario y agilizar sus operaciones.

Requerimientos del sistema

Productos
  Cada producto tiene un código único, nombre, descripción, unidad de medida (litros, kilos, unidades, etc.), y un precio de venta.
  Además, se registra su stock mínimo para alertas de reposición.

Proveedores
  Se debe registrar información de los proveedores: RUC, razón social, dirección, teléfono y correo electrónico.

Compras
  Cada vez que se compra un producto, se registra:
  Fecha de compra
  Proveedor
  Número de factura o boleta
  Detalle de productos comprados (cantidad y precio de compra).

Ventas
  Se registra cada venta realizada, incluyendo:
  Fecha de venta
  Cliente (nombre y DNI si es al por menor, RUC y razón social si es al por mayor)
  Productos vendidos con cantidad y precio unitario.

Entradas y salidas de inventario
  Cada ingreso por compra genera un movimiento de entrada en el inventario.
  Cada venta genera un movimiento de salida en el inventario.
  También se registran salidas por consumo interno (por ejemplo, productos usados en la limpieza de la tienda).

Usuarios del sistema
  El sistema tendrá usuarios con su nombre completo, cargo y clave de acceso, para controlar quién realiza los movimientos.

Actividades propuestas
✅ 1. Elaborar el modelo entidad-relación (E-R)
  Identifica entidades, atributos y relaciones (incluye cardinalidades).
  Ejemplo de entidades: Producto, Proveedor, Compra, Venta, Cliente, Usuario, Movimiento_Inventario.

✅ 2. Normalizar las tablas hasta 3FN
  Redacta las tablas con sus claves primarias y foráneas.
  Verifica eliminación de redundancias y dependencias parciales o transitivas.

✅ 3. Plantea 5 consultas SQL (opcional para práctica avanzada)
  Ejemplo: listar productos con stock menor al mínimo, total vendido por día, productos más vendidos, etc.

--------------------------------------------------------------------------------------------------------------------------------------------------------

CASO PROPUESTO – INTELIGENCIA DE NEGOCIOS PARA CONTROL DE INVENTARIOS
Contexto del negocio
La empresa Comercializadora Santa Rosa, dedicada a la venta de productos de limpieza al por mayor y menor, cuenta con un sistema de inventarios básico implementado en una base de datos transaccional. Sin embargo, la gerencia desea tomar decisiones estratégicas para mejorar la gestión de stock, optimizar compras y maximizar las ventas.
Para ello, buscan implementar una solución de Inteligencia de Negocios (BI) que les permita analizar de manera eficiente los datos de inventario, compras y ventas.

Necesidad de la empresa
La gerencia requiere:

Un sistema de reportes y dashboards que muestre:
  Los productos más vendidos por categoría y por periodo (día, semana, mes, año).
  El stock actual versus stock mínimo (alertas de reposición).
  Evolución de compras por proveedor (montos, cantidades y tendencias).
  Comparativo de precios de compra versus precios de venta (márgenes de ganancia).
  Consumo interno mensual de productos (uso en limpieza de local).

Analizar patrones de compra de clientes, para identificar:
  Clientes frecuentes y su ticket promedio.
  Clientes que han disminuido su compra en los últimos meses (para campañas de fidelización).

Un modelo de datos optimizado (Data Warehouse) que consolide:
  Datos históricos de ventas, compras y movimientos de inventario.
  Dimensiones para facilitar el análisis (tiempo, producto, proveedor, cliente, usuario).

Actividades propuestas
✅ 1. Diseñar un esquema de Data Warehouse (modelo estrella o copo de nieve)
  Hechos (Fact Table): compras, ventas, movimientos de inventario.
  Dimensiones: producto, proveedor, cliente, tiempo, usuario.

✅ 2. Plantear el proceso de ETL
  Fuentes de datos: base de datos transaccional de inventario y ventas.
  Procesos de extracción, transformación (limpieza, unificación de formatos, creación de claves sustitutas) y carga al DW.

✅ 3. Proponer dashboards clave (KPI’s) en Power BI o Tableau
  Visualizaciones de ventas por mes y categoría.
  Ranking de productos más vendidos.
  Alertas de stock mínimo.
  Evolución de compras a proveedores.

✅ 4. Analizar y proponer decisiones estratégicas
  Basadas en los insights que se obtengan: por ejemplo, ajustar el stock mínimo de productos de alta rotación, negociar mejores precios con proveedores frecuentes, realizar promociones para clientes con baja frecuencia de compra.

