-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-10-2019 a las 10:24:38
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desafio1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignarrol`
--

CREATE TABLE `asignarrol` (
  `codAsigRol` int(11) NOT NULL,
  `codRol` int(11) NOT NULL,
  `codProfesor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignarrol`
--

INSERT INTO `asignarrol` (`codAsigRol`, `codRol`, `codProfesor`) VALUES
(1, 3, 'h@gmail.com'),
(2, 2, 'g@gmail.com'),
(3, 1, 'a@gmail.com'),
(4, 1, 't@gmail.com'),
(5, 1, 'r@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aula`
--

CREATE TABLE `aula` (
  `codAula` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aula`
--

INSERT INTO `aula` (`codAula`, `descripcion`) VALUES
(101, 'Primera planta'),
(102, 'Primera planta'),
(103, 'Primera planta'),
(201, 'Segunda Planta'),
(202, 'Segunda Planta'),
(203, 'Segunda Planta'),
(301, 'Tercera planta'),
(302, 'Tercera planta'),
(303, 'Tercera planta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `franja`
--

CREATE TABLE `franja` (
  `codAula` int(11) NOT NULL,
  `codFranja` int(11) NOT NULL,
  `fechaDia` varchar(50) NOT NULL,
  `clave` int(11) NOT NULL,
  `inicioHora` varchar(5) NOT NULL,
  `finHora` varchar(5) NOT NULL,
  `codProfesor` varchar(50) DEFAULT NULL,
  `reservado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `franja`
--

INSERT INTO `franja` (`codAula`, `codFranja`, `fechaDia`, `clave`, `inicioHora`, `finHora`, `codProfesor`, `reservado`) VALUES
(101, 1, '2019-10-28', 2, '08:30', '09:25', NULL, 'LIBRE'),
(102, 1, '2019-10-28', 3, '08:30', '09:25', NULL, 'LIBRE'),
(103, 1, '2019-10-28', 4, '08:30', '09:25', NULL, 'LIBRE'),
(201, 1, '2019-10-28', 5, '08:30', '09:25', NULL, 'LIBRE'),
(202, 1, '2019-10-28', 6, '08:30', '09:25', NULL, 'LIBRE'),
(203, 1, '2019-10-28', 7, '08:30', '09:25', NULL, 'LIBRE'),
(301, 1, '2019-10-28', 8, '08:30', '09:25', NULL, 'LIBRE'),
(302, 1, '2019-10-28', 9, '08:30', '09:25', NULL, 'LIBRE'),
(303, 1, '2019-10-28', 10, '08:30', '09:25', NULL, 'LIBRE'),
(101, 2, '2019-10-28', 11, '09:25', '10:20', NULL, 'LIBRE'),
(102, 2, '2019-10-28', 12, '09:25', '10:20', NULL, 'LIBRE'),
(103, 2, '2019-10-28', 13, '09:25', '10:20', NULL, 'LIBRE'),
(201, 2, '2019-10-28', 14, '09:25', '10:20', NULL, 'LIBRE'),
(202, 2, '2019-10-28', 15, '09:25', '10:20', NULL, 'LIBRE'),
(203, 2, '2019-10-28', 16, '09:25', '10:20', NULL, 'LIBRE'),
(301, 2, '2019-10-28', 17, '09:25', '10:20', NULL, 'LIBRE'),
(302, 2, '2019-10-28', 18, '09:25', '10:20', NULL, 'LIBRE'),
(303, 2, '2019-10-28', 19, '09:25', '10:20', NULL, 'LIBRE'),
(101, 2, '2019-10-29', 20, '09:25', '10:20', NULL, 'LIBRE'),
(102, 2, '2019-10-29', 21, '09:25', '10:20', NULL, 'LIBRE'),
(103, 2, '2019-10-29', 22, '09:25', '10:20', NULL, 'LIBRE'),
(201, 2, '2019-10-29', 23, '09:25', '10:20', NULL, 'LIBRE'),
(202, 2, '2019-10-29', 24, '09:25', '10:20', NULL, 'LIBRE'),
(203, 2, '2019-10-29', 25, '09:25', '10:20', NULL, 'LIBRE'),
(301, 2, '2019-10-29', 26, '09:25', '10:20', NULL, 'LIBRE'),
(302, 2, '2019-10-29', 27, '09:25', '10:20', NULL, 'LIBRE'),
(303, 2, '2019-10-29', 28, '09:25', '10:20', NULL, 'LIBRE'),
(101, 3, '2019-10-28', 29, '08:30', '08:30', NULL, 'LIBRE'),
(102, 3, '2019-10-28', 30, '08:30', '08:30', NULL, 'LIBRE'),
(103, 3, '2019-10-28', 31, '08:30', '08:30', NULL, 'LIBRE'),
(201, 3, '2019-10-28', 32, '08:30', '08:30', NULL, 'LIBRE'),
(202, 3, '2019-10-28', 33, '08:30', '08:30', NULL, 'LIBRE'),
(203, 3, '2019-10-28', 34, '08:30', '08:30', NULL, 'LIBRE'),
(301, 3, '2019-10-28', 35, '08:30', '08:30', NULL, 'LIBRE'),
(302, 3, '2019-10-28', 36, '08:30', '08:30', NULL, 'LIBRE'),
(303, 3, '2019-10-28', 37, '08:30', '08:30', NULL, 'LIBRE'),
(101, 1, '2019-10-29', 38, '08:30', '09:25', NULL, 'LIBRE'),
(102, 1, '2019-10-29', 39, '08:30', '09:25', NULL, 'LIBRE'),
(103, 1, '2019-10-29', 40, '08:30', '09:25', NULL, 'LIBRE'),
(201, 1, '2019-10-29', 41, '08:30', '09:25', NULL, 'LIBRE'),
(202, 1, '2019-10-29', 42, '08:30', '09:25', NULL, 'LIBRE'),
(203, 1, '2019-10-29', 43, '08:30', '09:25', NULL, 'LIBRE'),
(301, 1, '2019-10-29', 44, '08:30', '09:25', NULL, 'LIBRE'),
(302, 1, '2019-10-29', 45, '08:30', '09:25', NULL, 'LIBRE'),
(303, 1, '2019-10-29', 46, '08:30', '09:25', NULL, 'LIBRE'),
(101, 3, '2019-10-28', 47, '10:20', '11:15', NULL, 'LIBRE'),
(102, 3, '2019-10-28', 48, '10:20', '11:15', NULL, 'LIBRE'),
(103, 3, '2019-10-28', 49, '10:20', '11:15', NULL, 'LIBRE'),
(201, 3, '2019-10-28', 50, '10:20', '11:15', NULL, 'LIBRE'),
(202, 3, '2019-10-28', 51, '10:20', '11:15', NULL, 'LIBRE'),
(203, 3, '2019-10-28', 52, '10:20', '11:15', NULL, 'LIBRE'),
(301, 3, '2019-10-28', 53, '10:20', '11:15', NULL, 'LIBRE'),
(302, 3, '2019-10-28', 54, '10:20', '11:15', NULL, 'LIBRE'),
(303, 3, '2019-10-28', 55, '10:20', '11:15', NULL, 'LIBRE'),
(101, 3, '2019-10-29', 56, '10:20', '11:15', NULL, 'LIBRE'),
(102, 3, '2019-10-29', 57, '10:20', '11:15', NULL, 'LIBRE'),
(103, 3, '2019-10-29', 58, '10:20', '11:15', NULL, 'LIBRE'),
(201, 3, '2019-10-29', 59, '10:20', '11:15', NULL, 'LIBRE'),
(202, 3, '2019-10-29', 60, '10:20', '11:15', NULL, 'LIBRE'),
(203, 3, '2019-10-29', 61, '10:20', '11:15', NULL, 'LIBRE'),
(301, 3, '2019-10-29', 62, '10:20', '11:15', NULL, 'LIBRE'),
(302, 3, '2019-10-29', 63, '10:20', '11:15', NULL, 'LIBRE'),
(303, 3, '2019-10-29', 64, '10:20', '11:15', NULL, 'LIBRE'),
(101, 4, '2019-10-28', 65, '11:15', '12:40', NULL, 'LIBRE'),
(102, 4, '2019-10-28', 66, '11:15', '12:40', NULL, 'LIBRE'),
(103, 4, '2019-10-28', 67, '11:15', '12:40', NULL, 'LIBRE'),
(201, 4, '2019-10-28', 68, '11:15', '12:40', NULL, 'LIBRE'),
(202, 4, '2019-10-28', 69, '11:15', '12:40', NULL, 'LIBRE'),
(203, 4, '2019-10-28', 70, '11:15', '12:40', NULL, 'LIBRE'),
(301, 4, '2019-10-28', 71, '11:15', '12:40', NULL, 'LIBRE'),
(302, 4, '2019-10-28', 72, '11:15', '12:40', NULL, 'LIBRE'),
(303, 4, '2019-10-28', 73, '11:15', '12:40', NULL, 'LIBRE'),
(101, 4, '2019-10-29', 74, '11:15', '12:40', NULL, 'LIBRE'),
(102, 4, '2019-10-29', 75, '11:15', '12:40', NULL, 'LIBRE'),
(103, 4, '2019-10-29', 76, '11:15', '12:40', NULL, 'LIBRE'),
(201, 4, '2019-10-29', 77, '11:15', '12:40', NULL, 'LIBRE'),
(202, 4, '2019-10-29', 78, '11:15', '12:40', NULL, 'LIBRE'),
(203, 4, '2019-10-29', 79, '11:15', '12:40', NULL, 'LIBRE'),
(301, 4, '2019-10-29', 80, '11:15', '12:40', NULL, 'LIBRE'),
(302, 4, '2019-10-29', 81, '11:15', '12:40', NULL, 'LIBRE'),
(303, 4, '2019-10-29', 82, '11:15', '12:40', NULL, 'LIBRE'),
(101, 5, '2019-10-28', 83, '12:40', '13:35', NULL, 'LIBRE'),
(102, 5, '2019-10-28', 84, '12:40', '13:35', NULL, 'LIBRE'),
(103, 5, '2019-10-28', 85, '12:40', '13:35', NULL, 'LIBRE'),
(201, 5, '2019-10-28', 86, '12:40', '13:35', NULL, 'LIBRE'),
(202, 5, '2019-10-28', 87, '12:40', '13:35', NULL, 'LIBRE'),
(203, 5, '2019-10-28', 88, '12:40', '13:35', NULL, 'LIBRE'),
(301, 5, '2019-10-28', 89, '12:40', '13:35', NULL, 'LIBRE'),
(302, 5, '2019-10-28', 90, '12:40', '13:35', NULL, 'LIBRE'),
(303, 5, '2019-10-28', 91, '12:40', '13:35', NULL, 'LIBRE'),
(101, 5, '2019-10-29', 92, '12:40', '13:35', NULL, 'LIBRE'),
(102, 5, '2019-10-29', 93, '12:40', '13:35', NULL, 'LIBRE'),
(103, 5, '2019-10-29', 94, '12:40', '13:35', NULL, 'LIBRE'),
(201, 5, '2019-10-29', 95, '12:40', '13:35', NULL, 'LIBRE'),
(202, 5, '2019-10-29', 96, '12:40', '13:35', NULL, 'LIBRE'),
(203, 5, '2019-10-29', 97, '12:40', '13:35', NULL, 'LIBRE'),
(301, 5, '2019-10-29', 98, '12:40', '13:35', NULL, 'LIBRE'),
(302, 5, '2019-10-29', 99, '12:40', '13:35', NULL, 'LIBRE'),
(303, 5, '2019-10-29', 100, '12:40', '13:35', NULL, 'LIBRE'),
(101, 6, '2019-10-28', 101, '13:35', '14:30', NULL, 'LIBRE'),
(102, 6, '2019-10-28', 102, '13:35', '14:30', NULL, 'LIBRE'),
(103, 6, '2019-10-28', 103, '13:35', '14:30', NULL, 'LIBRE'),
(201, 6, '2019-10-28', 104, '13:35', '14:30', NULL, 'LIBRE'),
(202, 6, '2019-10-28', 105, '13:35', '14:30', NULL, 'LIBRE'),
(203, 6, '2019-10-28', 106, '13:35', '14:30', NULL, 'LIBRE'),
(301, 6, '2019-10-28', 107, '13:35', '14:30', NULL, 'LIBRE'),
(302, 6, '2019-10-28', 108, '13:35', '14:30', NULL, 'LIBRE'),
(303, 6, '2019-10-28', 109, '13:35', '14:30', NULL, 'LIBRE'),
(101, 6, '2019-10-29', 110, '13:35', '14:30', NULL, 'LIBRE'),
(102, 6, '2019-10-29', 111, '13:35', '14:30', NULL, 'LIBRE'),
(103, 6, '2019-10-29', 112, '13:35', '14:30', NULL, 'LIBRE'),
(201, 6, '2019-10-29', 113, '13:35', '14:30', NULL, 'LIBRE'),
(202, 6, '2019-10-29', 114, '13:35', '14:30', NULL, 'LIBRE'),
(203, 6, '2019-10-29', 115, '13:35', '14:30', NULL, 'LIBRE'),
(301, 6, '2019-10-29', 116, '13:35', '14:30', NULL, 'LIBRE'),
(302, 6, '2019-10-29', 117, '13:35', '14:30', NULL, 'LIBRE'),
(303, 6, '2019-10-29', 118, '13:35', '14:30', NULL, 'LIBRE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `codRol` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`codRol`, `descripcion`) VALUES
(1, 'Profesor'),
(2, 'Administrador de aulas'),
(3, 'Administrador general');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `correo` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int(4) NOT NULL,
  `foto` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`correo`, `clave`, `nombre`, `apellido`, `edad`, `foto`) VALUES
('a@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'qwe', 'wqeqw', 234, ''),
('g@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'wre', 'wqe', 34, ''),
('h@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'ew', 'qwe', 3, ''),
('r@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'wer', 'esfad', 21, 0x4e554c4c),
('t@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'qwe', 'qwe', 23, 0x4e554c4c);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignarrol`
--
ALTER TABLE `asignarrol`
  ADD PRIMARY KEY (`codAsigRol`),
  ADD KEY `fk_codProfesor_usuario_asignarRol` (`codProfesor`),
  ADD KEY `fk_codRol_rol_asignarRol` (`codRol`);

--
-- Indices de la tabla `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`codAula`);

--
-- Indices de la tabla `franja`
--
ALTER TABLE `franja`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `fk_codAula_aula_Franja` (`codAula`),
  ADD KEY `fk_codprofesor_usuario_Franja` (`codProfesor`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`codRol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignarrol`
--
ALTER TABLE `asignarrol`
  MODIFY `codAsigRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `franja`
--
ALTER TABLE `franja`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignarrol`
--
ALTER TABLE `asignarrol`
  ADD CONSTRAINT `fk_codProfesor_usuario_asignarRol` FOREIGN KEY (`codProfesor`) REFERENCES `usuario` (`correo`),
  ADD CONSTRAINT `fk_codRol_rol_asignarRol` FOREIGN KEY (`codRol`) REFERENCES `rol` (`codRol`);

--
-- Filtros para la tabla `franja`
--
ALTER TABLE `franja`
  ADD CONSTRAINT `fk_codAula_aula_Franja` FOREIGN KEY (`codAula`) REFERENCES `aula` (`codAula`),
  ADD CONSTRAINT `fk_codprofesor_usuario_Franja` FOREIGN KEY (`codProfesor`) REFERENCES `usuario` (`correo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
