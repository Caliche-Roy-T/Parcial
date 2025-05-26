USE `parcial`;
DROP procedure IF EXISTS `fabricante`;

DELIMITER $$
USE `parcial`$$
CREATE PROCEDURE `fabricante` (
	in nom Varchar(100)
)
BEGIN
	insert into fabricante (nombre) values (nom);
END$$

DELIMITER ;
