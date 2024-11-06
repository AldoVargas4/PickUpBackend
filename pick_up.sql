-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2024 a las 18:28:20
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pick_up`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envio` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `direccion_envio` text DEFAULT NULL,
  `estado_envio` varchar(50) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedidos`
--

CREATE TABLE `estado_pedidos` (
  `id_estado` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresias`
--

CREATE TABLE `membresias` (
  `id_membresia` int(11) NOT NULL,
  `tipo_membresia` varchar(50) DEFAULT NULL,
  `descuento_envio` decimal(5,2) DEFAULT NULL,
  `precio_especial` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `membresias`
--

INSERT INTO `membresias` (`id_membresia`, `tipo_membresia`, `descuento_envio`, `precio_especial`) VALUES
(1, 'Estándar', 0.00, 0.00),
(2, 'Premium', 10.00, 20.00),
(3, 'VIP', 15.00, 25.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `estado_pago` varchar(50) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `weight` double NOT NULL,
  `countryOrigin` varchar(50) NOT NULL,
  `quality` varchar(50) NOT NULL,
  `check_` tinyint(1) NOT NULL,
  `minWeight` double NOT NULL,
  `imgProducto` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `category`, `weight`, `countryOrigin`, `quality`, `check_`, `minWeight`, `imgProducto`) VALUES
(1, 'Pan con Palta', 'Delicioso pan con palta fresca', 5.00, 'Sandwiches', 0.2, 'Perú', 'Alta', 1, 0.15, ''),
(2, 'Pan con Pollo', 'Pan relleno de pollo desmenuzado y mayonesa', 6.50, 'Sandwiches', 0.25, 'Perú', 'Alta', 1, 0.18, ''),
(3, 'Pan con Jamón y Queso', 'Pan con jamón y queso fundido', 4.50, 'Sandwiches', 0.22, 'Perú', 'Media', 1, 0.17, ''),
(4, 'Café Americano', 'Café 100% orgánico', 4.00, 'Bebidas', 0.15, 'Colombia', 'Alta', 1, 0.1, ''),
(5, 'Té Helado', 'Té negro helado con limón', 3.00, 'Bebidas', 0.2, 'Argentina', 'Media', 1, 0.15, ''),
(6, 'Chocolate Caliente', 'Chocolate caliente con leche', 4.50, 'Bebidas', 0.25, 'Perú', 'Alta', 1, 0.2, ''),
(7, 'Brownie de Chocolate', 'Brownie de chocolate con nueces', 2.50, 'Postres', 0.1, 'EE.UU.', 'Alta', 1, 0.08, ''),
(8, 'Cheesecake', 'Tarta de queso con base de galleta', 3.00, 'Postres', 0.12, 'Argentina', 'Alta', 1, 0.1, ''),
(9, 'Tarta de Manzana', 'Tarta de manzana con canela', 3.50, 'Postres', 0.18, 'España', 'Media', 1, 0.15, ''),
(10, 'Papas Fritas', 'Papas fritas crujientes', 1.50, 'Snacks', 0.05, 'Perú', 'Alta', 1, 0.03, ''),
(11, 'Chips de Maíz', 'Chips de maíz con sal', 1.20, 'Snacks', 0.07, 'México', 'Media', 1, 0.05, ''),
(12, 'Mix de Frutos Secos', 'Mezcla de frutos secos y pasas', 2.80, 'Snacks', 0.08, 'Chile', 'Alta', 1, 0.06, ''),
(13, 'Manzana Roja', 'Manzana roja fresca', 1.00, 'Frutas', 0.15, 'Perú', 'Alta', 1, 0.1, ''),
(14, 'Plátano', 'Banana madura', 0.90, 'Frutas', 0.18, 'Ecuador', 'Alta', 1, 0.12, ''),
(15, 'Uvas', 'Uvas frescas y dulces', 1.20, 'Frutas', 0.2, 'Chile', 'Media', 1, 0.15, ''),
(16, 'Jugo de Naranja', 'Jugo de naranja recién exprimido', 3.00, 'Jugos Naturales', 0.3, 'España', 'Alta', 1, 0.25, ''),
(17, 'Jugo de Fresa', 'Jugo de fresa natural', 3.50, 'Jugos Naturales', 0.28, 'Perú', 'Media', 1, 0.22, ''),
(18, 'Jugo de Mango', 'Jugo de mango fresco', 3.80, 'Jugos Naturales', 0.32, 'Brasil', 'Alta', 1, 0.28, ''),
(19, 'Pan con Chicharrón', 'Pan con chicharrón de cerdo y camote', 7.50, 'Sandwiches', 0.35, 'Perú', 'Alta', 1, 0.3, ''),
(20, 'Pan con Queso y Tomate', 'Pan con queso fresco y tomate', 5.20, 'Sandwiches', 0.22, 'Perú', 'Media', 1, 0.18, ''),
(21, 'Té de Hierbas', 'Infusión de hierbas naturales', 2.80, 'Bebidas', 0.15, 'Argentina', 'Alta', 1, 0.1, ''),
(22, 'Jugo de Sandía', 'Jugo de sandía fresca', 3.20, 'Jugos Naturales', 0.28, 'México', 'Alta', 1, 0.25, ''),
(23, 'Helado de Chocolate', 'Helado cremoso de chocolate', 3.50, 'Postres', 0.18, 'EE.UU.', 'Alta', 1, 0.15, ''),
(24, 'Ensalada de Frutas', 'Ensalada de frutas frescas', 2.50, 'Postres', 0.2, 'Chile', 'Media', 1, 0.15, ''),
(25, 'Manzana Verde', 'Manzana verde ácida', 1.20, 'Frutas', 0.16, 'Argentina', 'Alta', 1, 0.12, ''),
(26, 'Chifles', 'Chips de plátano verde', 1.80, 'Snacks', 0.06, 'Perú', 'Alta', 1, 0.04, ''),
(27, 'Alfajores', 'Dulce de leche en galleta', 1.50, 'Postres', 0.07, 'Perú', 'Media', 1, 0.06, ''),
(28, 'Pan con Hamburguesa', 'Hamburguesa de carne con pan y vegetales', 6.00, 'Sandwiches', 0.3, 'Perú', 'Alta', 1, 0.2, ''),
(29, 'Jugo de Papaya', 'Jugo natural de papaya', 3.20, 'Jugos Naturales', 0.29, 'Perú', 'Media', 1, 0.25, ''),
(30, 'Plátano Orgánico', 'Banana orgánica y fresca', 1.10, 'Frutas', 0.17, 'Ecuador', 'Alta', 1, 0.12, ''),
(31, 'Pan con Palta', 'Delicioso pan con palta fresca', 5.00, 'Sandwiches', 0.2, 'Perú', 'Alta', 1, 0.15, NULL),
(32, 'Pan con Pollo', 'Pan relleno de pollo desmenuzado y mayonesa', 6.50, 'Sandwiches', 0.25, 'Perú', 'Alta', 1, 0.18, NULL),
(33, 'Pan con Jamón y Queso', 'Pan con jamón y queso fundido', 4.50, 'Sandwiches', 0.22, 'Perú', 'Media', 1, 0.17, NULL),
(34, 'Café Americano', 'Café 100% orgánico', 4.00, 'Bebidas', 0.15, 'Colombia', 'Alta', 1, 0.1, NULL),
(35, 'Té Helado', 'Té negro helado con limón', 3.00, 'Bebidas', 0.2, 'Argentina', 'Media', 1, 0.15, NULL),
(36, 'Chocolate Caliente', 'Chocolate caliente con leche', 4.50, 'Bebidas', 0.25, 'Perú', 'Alta', 1, 0.2, NULL),
(37, 'Brownie de Chocolate', 'Brownie de chocolate con nueces', 2.50, 'Postres', 0.1, 'EE.UU.', 'Alta', 1, 0.08, NULL),
(38, 'Cheesecake', 'Tarta de queso con base de galleta', 3.00, 'Postres', 0.12, 'Argentina', 'Alta', 1, 0.1, NULL),
(39, 'Tarta de Manzana', 'Tarta de manzana con canela', 3.50, 'Postres', 0.18, 'España', 'Media', 1, 0.15, NULL),
(40, 'Papas Fritas', 'Papas fritas crujientes', 1.50, 'Snacks', 0.05, 'Perú', 'Alta', 1, 0.03, NULL),
(41, 'Chips de Maíz', 'Chips de maíz con sal', 1.20, 'Snacks', 0.07, 'México', 'Media', 1, 0.05, NULL),
(42, 'Mix de Frutos Secos', 'Mezcla de frutos secos y pasas', 2.80, 'Snacks', 0.08, 'Chile', 'Alta', 1, 0.06, NULL),
(43, 'Manzana Roja', 'Manzana roja fresca', 1.00, 'Frutas', 0.15, 'Perú', 'Alta', 1, 0.1, NULL),
(44, 'Plátano', 'Banana madura', 0.90, 'Frutas', 0.18, 'Ecuador', 'Alta', 1, 0.12, NULL),
(45, 'Uvas', 'Uvas frescas y dulces', 1.20, 'Frutas', 0.2, 'Chile', 'Media', 1, 0.15, NULL),
(46, 'Jugo de Naranja', 'Jugo de naranja recién exprimido', 3.00, 'Jugos Naturales', 0.3, 'España', 'Alta', 1, 0.25, NULL),
(47, 'Jugo de Fresa', 'Jugo de fresa natural', 3.50, 'Jugos Naturales', 0.28, 'Perú', 'Media', 1, 0.22, NULL),
(48, 'Jugo de Mango', 'Jugo de mango fresco', 3.80, 'Jugos Naturales', 0.32, 'Brasil', 'Alta', 1, 0.28, NULL),
(49, 'Pan con Chicharrón', 'Pan con chicharrón de cerdo y camote', 7.50, 'Sandwiches', 0.35, 'Perú', 'Alta', 1, 0.3, NULL),
(50, 'Pan con Queso y Tomate', 'Pan con queso fresco y tomate', 5.20, 'Sandwiches', 0.22, 'Perú', 'Media', 1, 0.18, NULL),
(51, 'Té de Hierbas', 'Infusión de hierbas naturales', 2.80, 'Bebidas', 0.15, 'Argentina', 'Alta', 1, 0.1, NULL),
(52, 'Jugo de Sandía', 'Jugo de sandía fresca', 3.20, 'Jugos Naturales', 0.28, 'México', 'Alta', 1, 0.25, NULL),
(53, 'Helado de Chocolate', 'Helado cremoso de chocolate', 3.50, 'Postres', 0.18, 'EE.UU.', 'Alta', 1, 0.15, NULL),
(54, 'Ensalada de Frutas', 'Ensalada de frutas frescas', 2.50, 'Postres', 0.2, 'Chile', 'Media', 1, 0.15, NULL),
(55, 'Manzana Verde', 'Manzana verde ácida', 1.20, 'Frutas', 0.16, 'Argentina', 'Alta', 1, 0.12, NULL),
(56, 'Chifles', 'Chips de plátano verde', 1.80, 'Snacks', 0.06, 'Perú', 'Alta', 1, 0.04, NULL),
(57, 'Alfajores', 'Dulce de leche en galleta', 1.50, 'Postres', 0.07, 'Perú', 'Media', 1, 0.06, NULL),
(58, 'Pan con Hamburguesa', 'Hamburguesa de carne con pan y vegetales', 6.00, 'Sandwiches', 0.3, 'Perú', 'Alta', 1, 0.2, NULL),
(59, 'Jugo de Papaya', 'Jugo natural de papaya', 3.20, 'Jugos Naturales', 0.29, 'Perú', 'Media', 1, 0.25, NULL),
(60, 'Plátano Orgánico', 'Banana orgánica y fresca', 1.10, 'Frutas', 0.17, 'Ecuador', 'Alta', 1, 0.12, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_membresia` int(11) DEFAULT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `estado_pedidos`
--
ALTER TABLE `estado_pedidos`
  ADD PRIMARY KEY (`id_estado`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `membresias`
--
ALTER TABLE `membresias`
  ADD PRIMARY KEY (`id_membresia`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_membresia` (`id_membresia`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estado_pedidos`
--
ALTER TABLE `estado_pedidos`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `membresias`
--
ALTER TABLE `membresias`
  MODIFY `id_membresia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estado_pedidos`
--
ALTER TABLE `estado_pedidos`
  ADD CONSTRAINT `estado_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_membresia`) REFERENCES `membresias` (`id_membresia`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
