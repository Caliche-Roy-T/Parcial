create database db_personas; use db_personas
CREATE TABLE persona ( 
id int NOT NULL AUTO_INCREMENT, 
identificacion varchar(50) NOT NULL, 
nombre varchar(50) NOT NULL, 
apellido varchar(50) NOT NULL, 
email varchar(100) NOT NULL, 
telefono varchar(20) DEFAULT NULL, 
direccion varchar(255) DEFAULT NULL, PRIMARY KEY (id) 
)
