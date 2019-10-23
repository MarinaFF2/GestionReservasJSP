-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2019 a las 21:27:54
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desafio1jsp`
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
(3, 1, 'a@gmail.com');

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
(303, 2, '2019-10-29', 28, '09:25', '10:20', NULL, 'LIBRE');

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
('h@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'ew', 'qwe', 3, '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignarrol`
--
ALTER TABLE `asignarrol`
  ADD PRIMARY KEY (`codAsigRol`);

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
  MODIFY `codAsigRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `franja`
--
ALTER TABLE `franja`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
