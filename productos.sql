drop database parcial;
create database parcial;
use parcial;

create table fabricante(
Codigo int auto_increment primary key,
Nombre varchar(100)
);
create table producto(
Codigo int auto_increment primary key,
Nombre varchar(100),
codigo_fabricante int,
Precio double
);

ALTER TABLE fabricante
ADD constraint fkcodigo_fabricante
FOREIGN KEY (Codigo) References producto(Codigo);
