USE `parcial`;
DROP procedure IF EXISTS `insert_fabricante`;

DELIMITER $$
USE `parcial`$$
CREATE PROCEDURE `insert_fabricante` (
	in nom varchar(100)
)
BEGIN
	insert into fabricante (nombre) values (nom);
END$$

DELIMITER ;