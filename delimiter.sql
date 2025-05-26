USE `parcial`;
DROP procedure IF EXISTS `insert_producto`;

DELIMITER $$
USE `parcial`$$
CREATE PROCEDURE `insert_producto` (
	in nom varchar(100),
    in codfa int,
    in pre double
)
BEGIN
	
    insert into producto (nombre, codigo_fabricante, precio) values (nom,codfa,pre);
END$$

DELIMITER ;
