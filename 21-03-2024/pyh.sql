-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2024 a las 03:30:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pyh`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `Id_cargo` int(11) NOT NULL,
  `Nombre_cargo` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Salario` double DEFAULT NULL,
  `Comision` float DEFAULT NULL,
  `Horario` enum('Mañana','Tarde','Noche','Fines_de_semana') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`Id_cargo`, `Nombre_cargo`, `Descripcion`, `Salario`, `Comision`, `Horario`) VALUES
(1, 'admin', 'administrador de tienda', 2500000, 2, 'Mañana'),
(2, 'admin de ventas', 'Administrador de ventas', 1500000, 3, 'Tarde'),
(3, 'admin de tiendas', 'Administrador de tiendass', 1800000, 9, 'Noche'),
(4, 'admin de tiendas', 'Administrador de tiendass', 1800000, 9, 'Noche');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id_Cliente` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Documento` int(11) DEFAULT NULL,
  `No_Documento` varchar(20) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Telefono` varchar(30) DEFAULT NULL,
  `E_mail` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Estado_civil` enum('Soltero','Casado','Separado','Union_libre','Viudo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despachos`
--

CREATE TABLE `despachos` (
  `Id_despachos` int(11) NOT NULL,
  `Id_factura_cabeza_FK` int(11) DEFAULT NULL,
  `No_Guia` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(60) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Fecha_recibido` date DEFAULT NULL,
  `Fecha_de_envio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `Id_empleado` int(11) NOT NULL,
  `Nom_empleado` varchar(30) DEFAULT NULL,
  `Ape_empleado` varchar(30) DEFAULT NULL,
  `Tipo_doc` enum('CC','CE','PPT','') DEFAULT NULL,
  `No_doc` varchar(30) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `E_mail` varchar(40) DEFAULT NULL,
  `Edad` varchar(3) DEFAULT NULL,
  `Sexo` enum('Masculino','Femenino','','') DEFAULT NULL,
  `Estado_civil` enum('Soltero','Casado','Separado','Union_Libre','Viudo') DEFAULT NULL,
  `Eps` enum('Aliansalud','Famisanar','Compensar','Salud_Total','Nueva_Eps','Sisben') DEFAULT NULL,
  `Pension` enum('Porvenir','Proteccion','Colfondos','Colpensiones') DEFAULT NULL,
  `No_hijos` varchar(3) DEFAULT NULL,
  `Fecha_ingreso` date DEFAULT NULL,
  `Id_cargo_FK` int(11) DEFAULT NULL,
  `Tipo_contrato` enum('Indefinido','Termino_Fijo','Prestacion_Servicios','') DEFAULT NULL,
  `Rh` enum('O+','O-','A+','A-','B+','B-','AB+','AB-') DEFAULT NULL,
  `Cta_nomina` varchar(30) DEFAULT NULL,
  `Entidad_financiera` enum('Banco_Davivienda','Banco_Corpbanca','Bancolombia','Banco_de_Occidente','Banco_Av_Villas','Banco_Popular','BBVA','Banco_Santander','Colmena','GNB_Sudameris','Banco_de_Bogota','Citi','Colpatria') DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad_factura_cabeza`
--

CREATE TABLE `entidad_factura_cabeza` (
  `Id_factura_cabeza` int(11) NOT NULL,
  `Fecha_expedicion` date DEFAULT NULL,
  `Fecha_vencimiento` int(11) DEFAULT NULL,
  `Id_cliente_FK` int(11) DEFAULT NULL,
  `Id_empleado_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad_factura_detalle`
--

CREATE TABLE `entidad_factura_detalle` (
  `Id_factura_detalle` int(11) NOT NULL,
  `Id_factura_cabeza_FK` int(11) DEFAULT NULL,
  `Forma_pago` enum('Efectivo','Transferencia','','') DEFAULT NULL,
  `Id_producto_FK` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Valor_unitario` double DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Subtotal` double DEFAULT NULL,
  `Iva` double DEFAULT NULL,
  `Descuento` double DEFAULT NULL,
  `Total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina`
--

CREATE TABLE `nomina` (
  `Id_nomina` int(11) NOT NULL,
  `Id_empleado_FK` int(11) DEFAULT NULL,
  `Salario` double DEFAULT NULL,
  `Dias_trabajados` int(11) DEFAULT NULL,
  `IBC` double DEFAULT NULL,
  `Aux_transporte` double DEFAULT NULL,
  `Cantidad_he` int(11) DEFAULT NULL,
  `Tipo_horas` enum('Diurnas','Nocturnas','Dominicales','Recargo_Nocturno') DEFAULT NULL,
  `Vr_horas_extras` double DEFAULT NULL,
  `Comision` double DEFAULT NULL,
  `Total_devengado` double DEFAULT NULL,
  `Salud` double DEFAULT NULL,
  `Pension` double DEFAULT NULL,
  `Prestamos_otros` double DEFAULT NULL,
  `Total_deducido` double DEFAULT NULL,
  `Neto_pagar` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_cabeza`
--

CREATE TABLE `pedidos_cabeza` (
  `Id_pedidos_cabeza` int(11) NOT NULL,
  `Id_proveedor_FK` int(11) DEFAULT NULL,
  `Fecha_expedicion` date DEFAULT NULL,
  `Fecha_Vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_detalle`
--

CREATE TABLE `pedidos_detalle` (
  `Id_pedido_detalle` int(11) NOT NULL,
  `Id_pedido_cabeza_FK` int(11) DEFAULT NULL,
  `Total_pedido` float DEFAULT NULL,
  `Estado_pedido` enum('Pendiente','En Proceso','Enviado','Entregado') DEFAULT NULL,
  `Fecha_pedido` date DEFAULT NULL,
  `Metodo_pago` varchar(60) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Id_producto` int(11) DEFAULT NULL,
  `Tipo_de_pago` enum('Pse','Tarjeta_de_credito','Efectivo','Cheque') DEFAULT NULL,
  `Metodo_de_Envio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_producto` int(11) NOT NULL,
  `Tipo_producto` enum('Dama','Caballero','Infantil','') DEFAULT NULL,
  `Referencia` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Id_Proveedor_FK` int(11) DEFAULT NULL,
  `Valor_compra` double DEFAULT NULL,
  `Valor_venta` double DEFAULT NULL,
  `Existencia` int(11) DEFAULT NULL,
  `Nro_lote` varchar(30) DEFAULT NULL,
  `Fecha_fabricacion` date DEFAULT NULL,
  `Fecha_Vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Id_proveedor` int(11) NOT NULL,
  `Nombre_proveedor` varchar(60) DEFAULT NULL,
  `Tipo_doc_proveedor` enum('Rut','Nit','CC','') DEFAULT NULL,
  `Numero_doc_Proveedor` varchar(20) DEFAULT NULL,
  `Ciudad_Proveedor` varchar(60) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `E_mail` varchar(60) DEFAULT NULL,
  `Asesor_nombre` varchar(100) DEFAULT NULL,
  `Asesor_telefono` varchar(15) DEFAULT NULL,
  `Asesor_correo_electronico` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`Id_cargo`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_Cliente`);

--
-- Indices de la tabla `despachos`
--
ALTER TABLE `despachos`
  ADD PRIMARY KEY (`Id_despachos`),
  ADD KEY `COD_FACTURA_CABEZA_fk1` (`Id_factura_cabeza_FK`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id_empleado`),
  ADD KEY `Cargo_fk` (`Id_cargo_FK`);

--
-- Indices de la tabla `entidad_factura_cabeza`
--
ALTER TABLE `entidad_factura_cabeza`
  ADD PRIMARY KEY (`Id_factura_cabeza`),
  ADD KEY `ID_CLIENTE_fk` (`Id_cliente_FK`),
  ADD KEY `COD_EMPLEADO` (`Id_empleado_FK`);

--
-- Indices de la tabla `entidad_factura_detalle`
--
ALTER TABLE `entidad_factura_detalle`
  ADD PRIMARY KEY (`Id_factura_detalle`),
  ADD KEY `COD_FACTURA_CABEZA_fk` (`Id_factura_cabeza_FK`),
  ADD KEY `ID_PRODUCTO_fk1` (`Id_producto_FK`);

--
-- Indices de la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD PRIMARY KEY (`Id_nomina`),
  ADD KEY `Empleado_fk` (`Id_empleado_FK`);

--
-- Indices de la tabla `pedidos_cabeza`
--
ALTER TABLE `pedidos_cabeza`
  ADD PRIMARY KEY (`Id_pedidos_cabeza`),
  ADD KEY `Proveedor_fk1` (`Id_proveedor_FK`);

--
-- Indices de la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  ADD PRIMARY KEY (`Id_pedido_detalle`),
  ADD KEY `ID_PEDIDO_CABEZA_COD_fk` (`Id_pedido_cabeza_FK`),
  ADD KEY `ID_PRODUCTO_fk` (`Id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_producto`),
  ADD KEY `Proveedor_fk` (`Id_Proveedor_FK`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Id_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `Id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `despachos`
--
ALTER TABLE `despachos`
  MODIFY `Id_despachos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entidad_factura_cabeza`
--
ALTER TABLE `entidad_factura_cabeza`
  MODIFY `Id_factura_cabeza` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entidad_factura_detalle`
--
ALTER TABLE `entidad_factura_detalle`
  MODIFY `Id_factura_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nomina`
--
ALTER TABLE `nomina`
  MODIFY `Id_nomina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_cabeza`
--
ALTER TABLE `pedidos_cabeza`
  MODIFY `Id_pedidos_cabeza` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  MODIFY `Id_pedido_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `despachos`
--
ALTER TABLE `despachos`
  ADD CONSTRAINT `COD_FACTURA_CABEZA_fk1` FOREIGN KEY (`Id_factura_cabeza_FK`) REFERENCES `entidad_factura_cabeza` (`Id_factura_cabeza`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `Cargo_fk` FOREIGN KEY (`Id_cargo_FK`) REFERENCES `cargo` (`Id_cargo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entidad_factura_cabeza`
--
ALTER TABLE `entidad_factura_cabeza`
  ADD CONSTRAINT `COD_EMPLEADO` FOREIGN KEY (`Id_empleado_FK`) REFERENCES `empleados` (`Id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_CLIENTE_fk` FOREIGN KEY (`Id_cliente_FK`) REFERENCES `clientes` (`Id_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entidad_factura_detalle`
--
ALTER TABLE `entidad_factura_detalle`
  ADD CONSTRAINT `COD_FACTURA_CABEZA_fk` FOREIGN KEY (`Id_factura_cabeza_FK`) REFERENCES `entidad_factura_cabeza` (`Id_factura_cabeza`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_PRODUCTO_fk1` FOREIGN KEY (`Id_producto_FK`) REFERENCES `productos` (`Id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nomina`
--
ALTER TABLE `nomina`
  ADD CONSTRAINT `Empleado_fk` FOREIGN KEY (`Id_empleado_FK`) REFERENCES `empleados` (`Id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos_cabeza`
--
ALTER TABLE `pedidos_cabeza`
  ADD CONSTRAINT `Proveedor_fk1` FOREIGN KEY (`Id_proveedor_FK`) REFERENCES `proveedores` (`Id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  ADD CONSTRAINT `ID_PEDIDO_CABEZA_COD_fk` FOREIGN KEY (`Id_pedido_cabeza_FK`) REFERENCES `pedidos_cabeza` (`Id_pedidos_cabeza`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_PRODUCTO_fk` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `Proveedor_fk` FOREIGN KEY (`Id_Proveedor_FK`) REFERENCES `proveedores` (`Id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
