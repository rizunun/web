-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2024 a las 01:42:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `simple_login_system`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compania`
--

CREATE TABLE `compania` (
  `id_viaje` int(50) NOT NULL,
  `nombre` varchar(75) DEFAULT NULL,
  `Edad` int(100) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `VIP` text DEFAULT NULL,
  `Provincia` varchar(20) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `compania`
--

INSERT INTO `compania` (`id_viaje`, `nombre`, `Edad`, `Fecha`, `VIP`, `Provincia`, `id_usuario`) VALUES
(5, 'Oscar Patiño', 52, '2024-11-28', 'no', 'Barcelona', 30),
(6, 'Sara Lopez', 23, '2024-11-21', 'si', 'Bilbao', 27),
(7, 'Sara Perez', 34, '2024-11-01', 'no', 'Madrid', 27),
(9, 'Pablito', 23, '2024-11-28', 'no', 'Barcelona', 30),
(10, 'Pablito Duran', 45, '2024-11-09', 'si', 'Madrid', 29),
(11, 'Pablito Duran Ruiz', 12, '2024-11-01', 'no', 'Bilbao', 29),
(12, 'Pablito', 45, '2024-11-26', 'no', 'Barcelona', 29),
(13, 'Pablito', 13, '2024-11-28', 'no', 'Madrid', 29),
(14, 'Sara Lopez', 23, '2024-11-01', 'si', 'Madrid', 27),
(15, 'Sara Lopez', 54, '2024-11-21', 'no', 'Barcelona', 27),
(16, 'Sara Perez', 23, '2024-11-02', 'si', 'Bilbao', 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_usuario` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_usuario`, `username`, `password`) VALUES
(26, 'laka', '$2y$10$3fs67ZvaoaJsKQj2C/i/1.Zu1EdeVySDwt8lr5tuF.ErGHzvAAtbq'),
(27, 'Sarita', '$2y$10$LSQzsIZNS.F99V1SDb4xO.1qSk7PrEcJ8VL6rBMqnf/nlYHw.FqcG'),
(29, 'Pablito', '$2y$10$EoKoZgUQTpjsatY.ejn4hOq11r7mO7rt9gKIUDE0CH6zQsA9hjGOC'),
(30, 'Oscar', '$2y$10$2CTbCz3MtxmqYEM6W.A0ie5vEhOCLR1XNacoxegd3WD1esZBs9a86');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compania`
--
ALTER TABLE `compania`
  ADD PRIMARY KEY (`id_viaje`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compania`
--
ALTER TABLE `compania`
  MODIFY `id_viaje` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compania`
--
ALTER TABLE `compania`
  ADD CONSTRAINT `compania_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id_usuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
