drop database if exists parcial;
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

ALTER TABLE producto
ADD FOREIGN KEY (codigo_fabricante) References fabricante(Codigo);
