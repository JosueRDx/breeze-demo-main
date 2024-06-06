-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2024 a las 06:44:39
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
-- Base de datos: `breeze_demo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `completada` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `descripcion`, `completada`, `created_at`, `updated_at`, `user_id`, `categoria_id`) VALUES
(1, 'Tarea 1', 1, '2024-06-06 08:05:50', '2024-06-06 09:21:42', 1, NULL),
(2, 'Tarea 2', 1, '2024-06-06 08:05:50', '2024-06-06 09:21:44', 1, NULL),
(3, 'Tarea 3', 0, '2024-06-06 08:05:50', '2024-06-06 09:31:07', 1, NULL),
(4, 'Tarea 4', 0, '2024-06-06 08:05:50', '2024-06-06 08:05:50', 1, NULL),
(5, 'Tarea 5', 1, '2024-06-06 08:05:50', '2024-06-06 09:21:47', 1, NULL),
(6, 'Tarea 6', 0, '2024-06-06 08:05:50', '2024-06-06 08:05:50', 1, NULL),
(7, 'Tarea 7', 0, '2024-06-06 08:05:50', '2024-06-06 08:05:50', 1, NULL),
(8, 'Tarea 8', 0, '2024-06-06 08:05:50', '2024-06-06 08:05:50', 1, NULL),
(9, 'Tarea 9', 0, '2024-06-06 08:05:50', '2024-06-06 08:05:50', 1, NULL),
(10, 'Tarea 10', 0, '2024-06-06 08:05:50', '2024-06-06 08:05:50', 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tareas_user_id_foreign` (`user_id`),
  ADD KEY `tareas_categoria_id_foreign` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tareas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
