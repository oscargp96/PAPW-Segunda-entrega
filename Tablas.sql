CREATE TABLE `admi` (
  `admi_id` int(11) NOT NULL AUTO_INCREMENT,
  `admi_correo` varchar(50) NOT NULL,
  `admi_usuario` varchar(25) NOT NULL,
  `admi_telefono` varchar(10) DEFAULT NULL,
  `admi_contraseña` varchar(25) NOT NULL,
  PRIMARY KEY (`admi_id`),
  UNIQUE KEY `admi_correo` (`admi_correo`),
  UNIQUE KEY `admi_usuario` (`admi_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `articulo` (
  `articulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `articulo_fecha` datetime NOT NULL,
  `articulo_unidades` int(11) NOT NULL,
  `articulo_estado` varchar(10) DEFAULT NULL,
  `articulo_nombre` varchar(25) DEFAULT NULL,
  `articulo_descripcion` varchar(255) DEFAULT NULL,
  `admi_id` int(11) NOT NULL,
  PRIMARY KEY (`articulo_id`),
  KEY `admi_id` (`admi_id`),
  CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`admi_id`) REFERENCES `admi` (`admi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `califica` (
  `califica_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `articulo_id` int(11) NOT NULL,
  `calificacion` float NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`califica_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `articulo_id` (`articulo_id`),
  CONSTRAINT `califica_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  CONSTRAINT `califica_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`articulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `carrito` (
  `carrito_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`carrito_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `carrito_articulo` (
  `carrito_articulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `carrito_id` int(11) NOT NULL,
  `articulo_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`carrito_articulo_id`),
  KEY `carrito_id` (`carrito_id`),
  KEY `articulo_id` (`articulo_id`),
  CONSTRAINT `carrito_articulo_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carrito` (`carrito_id`),
  CONSTRAINT `carrito_articulo_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`articulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `categoria_articulo` (
  `categoria_articulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `articulo_id` int(11) NOT NULL,
  PRIMARY KEY (`categoria_articulo_id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `articulo_id` (`articulo_id`),
  CONSTRAINT `categoria_articulo_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `categoria_articulo_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`articulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_nombre` varchar(25) DEFAULT NULL,
  `cliente_apellido` varchar(25) DEFAULT NULL,
  `cliente_correo` varchar(50) NOT NULL,
  `cliente_usuario` varchar(25) NOT NULL,
  `cliente_telefono` varchar(10) DEFAULT NULL,
  `cliente_imagen` blob,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `cliente_correo` (`cliente_correo`),
  UNIQUE KEY `cliente_usuario` (`cliente_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `imagen` (
  `imagen_id` int(11) NOT NULL AUTO_INCREMENT,
  `articulo_id` int(11) NOT NULL,
  UNIQUE KEY `imagen_id` (`imagen_id`),
  KEY `articulo_id` (`articulo_id`),
  CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`articulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `mensajea` (
  `mensaje_id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje_fecha` datetime NOT NULL,
  `mensaje_contenido` varchar(255) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `admi_id` int(11) NOT NULL,
  PRIMARY KEY (`mensaje_id`),
  KEY `venta_id` (`venta_id`),
  KEY `admi_id` (`admi_id`),
  CONSTRAINT `mensajea_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`),
  CONSTRAINT `mensajea_ibfk_2` FOREIGN KEY (`admi_id`) REFERENCES `admi` (`admi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `mensajec` (
  `mensaje_id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje_fecha` datetime NOT NULL,
  `mensaje_contenido` varchar(255) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`mensaje_id`),
  KEY `venta_id` (`venta_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `mensajec_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`),
  CONSTRAINT `mensajec_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `venta` (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_fecha` datetime NOT NULL,
  `venta_precio` float NOT NULL,
  `venta_estado` varchar(10) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `admi_id` int(11) NOT NULL,
  PRIMARY KEY (`venta_id`),
  UNIQUE KEY `venta_precio` (`venta_precio`),
  KEY `cliente_id` (`cliente_id`),
  KEY `admi_id` (`admi_id`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`admi_id`) REFERENCES `admi` (`admi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `venta_articulo` (
  `venta_articulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) NOT NULL,
  `articulo_id` int(11) NOT NULL,
  `venta_articulo_cantidad` int(11) NOT NULL,
  PRIMARY KEY (`venta_articulo_id`),
  KEY `venta_id` (`venta_id`),
  KEY `articulo_id` (`articulo_id`),
  CONSTRAINT `venta_articulo_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`),
  CONSTRAINT `venta_articulo_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`articulo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
