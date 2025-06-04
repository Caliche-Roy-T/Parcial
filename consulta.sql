#ejer01 //Lista el nombre de todos los productos que hay en la tabla producto
select * from parcial.producto;
#ejer02 //Lista los nombres y los precios de todos los productos de la tabla producto
select nombre, precio from parcial.producto;
#ejer03 //Lista todas las columnas de la tabla producto.
select * from parcial.producto;
#ejer04 //Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select  nombre, precio *0.8432 ,precio from parcial.producto;
#ejer05 //Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
select nombre as nombre_producto, precio *0.8432 as euro, precio as dolares from parcial.producto;
#ejer06 //Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select upper(nombre) AS nombre_mayusculas, precio from producto;
#ejer07 //Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select lower(nombre) AS nombre_minusculas, precio from producto;
#ejer08 //Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre AS nombre_original, upper(left(nombre,2))AS iniciales_mayusculas from fabricante;
#ejer09 //Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio) AS precio_redondeado from producto;
#ejer10 //Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal. 
select nombre, truncate(precio,0) AS precio_truncado from producto;
#ejer11 //Lista el identificador de los fabricantes que tienen productos en la tabla producto. 
select codigo as identificador,nombre from producto;
#ejer12 //Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos. 
select distinct codigo as identificador, nombre from producto;
#ejer13 //Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre ASC;
#ejer14 // Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by nombre desc;
#ejer15 //  Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre, precio from producto order by nombre ASC, precio DESC;
#ejer16 // Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
#ejer17 //Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta. 
select * from fabricante limit 11 offset 2;
#ejer18 //Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT) 
select nombre, precio from producto order by precio ASC limit 1;
#ejer19 //Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio DESC limit 1;
#ejer20 //Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
select producto.Nombre AS nombre_producto, fabricante.Nombre AS nombre_fabricante
from producto join fabricante on codigo_fabricante = codigo_fabricante where codigo_fabricante = 2;
#ejer21 //Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre, precio from producto where precio <= 120;
#ejer22 //Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre, precio from producto where precio >= 400;
#ejer23 //Lista el nombre de los productos que no tienen un precio mayor o igual a 400€
select nombre, precio from producto where precio < 400;
#ejer24 // Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select nombre, precio from producto where precio >80 and precio <300;
#ejer25 //Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select nombre, precio from producto where precio between 60 AND 200;
#ejer26 //Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
select producto.nombre as nombre_producto, fabricante.nombre as nombre_fabricante, precio from producto join fabricante on codigo_fabricante = codigo_fabricante where precio>200 and codigo_fabricante = 6;