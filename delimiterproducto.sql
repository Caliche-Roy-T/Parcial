USE `parcial`;
DROP procedure IF EXISTS `insert_producto`;

DELIMITER $$
USE `parcial`$$
CREATE PROCEDURE `insert_producto` (
	in nom varchar(100),
    in pre double,
    in codfa int
)
BEGIN
	insert into producto (Nombre, codigo_fabricante, Precio) values (nom, codfa, pre);
END$$

DELIMITER ;