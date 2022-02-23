--
-- Base de datos: `Discografica`
--
CREATE DATABASE IF NOT EXISTS `discografica` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `discografica`;

-- estructura de la tabla 'discografica'

CREATE TABLE IF NOT EXISTS `discografica` (
	`CodDiscog` int(11) NOT NULL,
	`NomDiscog` varchar(40) COLLATE utf8_spanish2_ci DEFAULT NULL,
	
	PRIMARY KEY (`CodDiscog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- estructura de la tabla 'album'

CREATE TABLE IF NOT EXISTS `album` (
	`CodAlbum` int(11) NOT NULL,
    `NomAlbum` varchar(40) COLLATE utf8_spanish2_ci DEFAULT NULL,
    `NomArtista` varchar(40) COLLATE utf8_spanish2_ci DEFAULT NULL,
    `AnoLanzamiento` int (4) DEFAULT NULL,
    
    PRIMARY KEY (`CodAlbum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- insert into

INSERT INTO `discografica` (`CodDiscog`, `NomDiscog`) VALUES
(1, 'Discog1');

INSERT INTO `album` (`CodAlbum`, `NomAlbum`, `NomArtista`, `AnoLanzamiento`) VALUES
(1, 'album1', 'artista1', 1111);

CREATE TABLE IF NOT EXISTS `usuario` (
	`CodUsuario` int(11) NOT NULL,
	`usuario` varchar(20) NOT NULL,
    `contrasenia` varchar (20) NOT NULL,
	
	PRIMARY KEY (`CodUsuario`)
);

INSERT INTO `usuario` (`CodUsuario`, `usuario`, `contrasenia`) VALUES
(1, 'admin', 'admin');