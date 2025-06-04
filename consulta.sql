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
SELECT producto.nombre AS nombre_producto, fabricante.nombre AS nombre_fabricante, precio 
FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.Codigo WHERE precio > 200 AND producto.codigo_fabricante = 6;
#ejer27 //Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM producto 
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
#ejer28 //Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto WHERE codigo_fabricante IN (1, 3, 5);
#ejer29 //Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que sellame céntimos.
SELECT Nombre, Precio * 100 AS céntimos FROM producto;
#ejer30 //Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT Nombre FROM fabricante WHERE Nombre LIKE 'S%';
#ejer31 //Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante where nombre like 'E%';
#ejer32 //Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante where nombre like 'W%';
#ejer33 //Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;
#ejer34 //Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';
#ejer35 //Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto where nombre like '%Monitor%' and precio <215;
#ejer36 //Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select Nombre, Precio from producto
where Precio >= 180
ORDER BY Precio DESC, Nombre ASC;
#//1.1.4 Consultas multitabla (Composición interna)
#ejer01//Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.Nombre AS nombre_producto, producto.Precio, fabricante.Nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.Codigo;
#ejer02//Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
select producto.nombre as nombre_producto, producto.precio, fabricante.nombre as nombre_fabricante
from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
order by fabricante.nombre asc;
#ejer03//Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
select producto.codigo as id_producto, producto.nombre as nombre_producto, fabricante.codigo as id_fabricante, fabricante.nombre as nombre_fabricante
from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo;
#ejer04//Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select producto.nombre as nombre_producto, producto.precio, fabricante.nombre as nombre_fabricante
from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
order by producto.precio asc
limit 1;
#ejer05//Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select producto.nombre as nombre_producto, producto.precio, fabricante.nombre as nombre_fabricante
from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
order by producto.precio desc
limit 1;
#ejer06//Devuelve una lista de todos los productos del fabricante Lenovo.
select producto.* from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre = 'Lenovo';
#ejer07//Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€
select producto.* from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre = 'Crucial' and producto.precio > 200;
#ejer08//Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackardy Seagate. Sin utilizar el operador IN.
select producto.* from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre = 'Asus' 
   or fabricante.nombre = 'HewlettPackard' 
   or fabricante.nombre = 'Seagate';
#ejer09//Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackardy Seagate. Utilizando el operador IN.
select producto.*
from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre in ('Asus', 'HewlettPackard', 'Seagate');
#ejer10//Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
select producto.nombre, producto.precio from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre like '%e';
#ejer11 //Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
select producto.nombre, producto.precio from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre like '%w%';
#ejer12 //Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select producto.nombre as nombre_producto, producto.precio, fabricante.nombre as nombre_fabricante
from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where producto.precio >= 180
order by producto.precio desc, producto.nombre asc;
#ejer13 //Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
select distinct fabricante.codigo, fabricante.nombre from fabricante
join producto on fabricante.codigo = producto.codigo_fabricante;
#Consultas multitabla (Composición externa)
#ejer01 //Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
select fabricante.codigo as id_fabricante, fabricante.nombre as nombre_fabricante, producto.codigo as id_producto, producto.nombre as nombre_producto, producto.precio
from fabricante
left join producto on fabricante.codigo = producto.codigo_fabricante
order by fabricante.nombre asc;
#ejer02 //Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select fabricante.codigo as id_fabricante, fabricante.nombre as nombre_fabricante from fabricante
left join producto on fabricante.codigo = producto.codigo_fabricante
where producto.codigo is null;
#ejer03 //¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
#No, no pueden existir productos que no estén relacionados con un fabricante, y esto se debe a que:
#En la tabla producto, la columna codigo_fabricante es una llave foránea que referencia a fabricante.codigo.
#Además, al definir la relación con:
#alter table producto
#add foreign key (codigo_fabricante) references fabricante(codigo);
#se obliga que todo codigo_fabricante en producto debe coincidir con un fabricante existente.
#Por lo tanto, no se pueden insertar productos sin asignarles un fabricante válido, porque la base de datos lo impediría para mantener la integridad referencial.
#Consultas resumen
#ejer01// Calcula el número total de productos que hay en la tabla productos.
select count(*) as total_productos from producto;
#ejer02// Calcula el número total de fabricantes que hay en la tabla fabricante
select count(*) as total_fabricantes from fabricante;
#ejer03// Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
select count(distinct codigo_fabricante) as total_fabricantes_en_productos from producto;
#ejer04// Calcula la media del precio de todos los productos
select avg(precio) as precio_medio from producto;
#ejer05// Calcula el precio más barato de todos los productos.
select min(precio) as precio_minimo from producto;
#ejer06// Calcula el precio más caro de todos los productos.
select max(precio) as precio_maximo from producto;
#ejer07//Lista el nombre y el precio del producto más barato.
select nombre, precio from producto
where precio = (select min(precio) from producto);
#ejer08//Lista el nombre y el precio del producto más caro.
select nombre, precio from producto
where precio = (select max(precio) from producto);
#ejer09//Calcula la suma de los precios de todos los productos.
select sum(precio) as suma_precios from producto;
#ejer10//Calcula el número de productos que tiene el fabricante Asus
select count(*) as total_productos_asus from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre = 'Asus';
#ejer11//Calcula la media del precio de todos los productos del fabricante Asus.
select avg(producto.precio) as precio_medio_asus from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre = 'Asus';
#ejer12//Calcula el precio más barato de todos los productos del fabricante Asus.
select min(producto.precio) as precio_minimo_asus
from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre = 'Asus';
#ejer13//Calcula el precio más caro de todos los productos del fabricante Asus.
select max(producto.precio) as precio_maximo_asus
from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre = 'Asus';
#ejer14//Calcula la suma de todos los productos del fabricante Asus.
select sum(producto.precio) as suma_precios_asus from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre = 'Asus';
#ejer15//Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
select max(producto.precio) as precio_maximo, min(producto.precio) as precio_minimo,
avg(producto.precio) as precio_medio,
count(*) as total_productos from producto
join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre = 'Crucial';
#ejer16//Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
select  fabricante.nombre as nombre_fabricante, count(producto.codigo) as total_productos
from fabricante
left join producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
order by total_productos desc;
#ejer17//Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
select fabricante.nombre as nombre_fabricante, max(producto.precio) as precio_maximo, min(producto.precio) as precio_minimo,
avg(producto.precio) as precio_medio from fabricante
left join producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre;
#ejer18//Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
select fabricante.codigo as id_fabricante, max(producto.precio) as precio_maximo, min(producto.precio) as precio_minimo,
avg(producto.precio) as precio_medio,
count(producto.codigo) as total_productos from fabricante
join producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.codigo
having avg(producto.precio) > 200;
#ejer19// Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
select fabricante.nombre as nombre_fabricante, max(producto.precio) as precio_maximo, min(producto.precio) as precio_minimo,
avg(producto.precio) as precio_medio,
count(producto.codigo) as total_productos from fabricante
join producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
having avg(producto.precio) > 200;
#ejer20//Calcula el número de productos que tienen un precio mayor o igual a 180€.
select count(*) as total_productos_mayores_igual_180 from producto
where precio >= 180;
#ejer21//Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
select fabricante.nombre as nombre_fabricante,
count(producto.codigo) as total_productos_mayores_igual_180
from fabricante
left join producto on fabricante.codigo = producto.codigo_fabricante
and producto.precio >= 180
group by fabricante.nombre
order by total_productos_mayores_igual_180 desc;
#ejer22//Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante
select fabricante.codigo as id_fabricante,
avg(producto.precio) as precio_medio from fabricante
join producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.codigo;
#ejer23 Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
select fabricante.nombre as nombre_fabricante,
avg(producto.precio) as precio_medio
from fabricante
join producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre;
#ejer24 //Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
select fabricante.nombre as nombre_fabricante from fabricante
join producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
having avg(producto.precio) >= 150;
#ejer25 //Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos
select fabricante.nombre as nombre_fabricante from fabricante
join producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
having count(producto.codigo) >= 2;
#ejer26 //Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición
select fabricante.nombre as nombre_fabricante,
count(producto.codigo) as total_productos_220_o_mas
from fabricante
join producto on fabricante.codigo = producto.codigo_fabricante
where producto.precio >= 220
group by fabricante.nombre;
#ejer27// Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
select fabricante.nombre as nombre_fabricante,
count(producto.codigo) as total_productos_220_o_mas from fabricante
left join producto 
on fabricante.codigo = producto.codigo_fabricante
and producto.precio >= 220
group by fabricante.nombre;
#ejer28// Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
select fabricante.nombre as nombre_fabricante from fabricante
join producto on fabricante.codigo = producto.codigo_fabricante
group by fabricante.nombre
having sum(producto.precio) > 1000;
#ejer29//Devuelve un listado con el nombre del producto más caro que tiene cada fabricante.El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
select p.nombre as nombre_producto, p.precio, f.nombre as nombre_fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where p.precio = (
select max(p2.precio) from producto p2
where p2.codigo_fabricante = p.codigo_fabricante
)
order by f.nombre asc;
#Subconsultas (En la cláusula WHERE)
#ejer01//Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * from producto
where codigo_fabricante = (
  select codigo
  from fabricante
  where nombre = 'Lenovo'
);
#ejer02//Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * from producto
where precio = (
  select max(precio)
  from producto
  where codigo_fabricante = (
    select codigo
    from fabricante
    where nombre = 'Lenovo'
  )
);
#ejer03//Lista el nombre del producto más caro del fabricante Lenovo.
select nombre from producto
where codigo_fabricante = (
  select codigo
  from fabricante
  where nombre = 'Lenovo'
)
order by precio desc
limit 1;
#ejer04//Lista el nombre del producto más barato del fabricante Hewlett-Packard
select nombre from producto
where codigo_fabricante = (
  select codigo
  from fabricante
  where nombre = 'Hewlett-Packard'
)
order by precio asc
limit 1;
#ejer05//Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
select * from producto
where precio >= (
  select max(precio)
  from producto
  where codigo_fabricante = (
    select codigo
    from fabricante
    where nombre = 'Lenovo'
  )
);
#ejer06//Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos
select * from producto
where codigo_fabricante = (
  select codigo
  from fabricante
  where nombre = 'Asus'
)
and precio > (
  select avg(precio)
  from producto
  where codigo_fabricante = (
    select codigo
    from fabricante
    where nombre = 'Asus'
  )
);
#ejer07//Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
select * from producto p1
where not exists (
  select 1
  from producto p2
  where p2.precio > p1.precio
);
#ejer08//Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
select * from producto p1
where not exists (
  select 1
  from producto p2
  where p2.precio < p1.precio
);
#ejer09//Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
select nombre from fabricante
where codigo = any (
  select codigo_fabricante
  from producto
);
#ejer10//Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
select nombre from fabricante
where codigo <> all (
  select codigo_fabricante
  from producto
);
#ejer11//Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
select nombre from fabricante
where codigo in (
  select codigo_fabricante
  from producto
);
#ejer12//Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
select nombre from fabricante
where codigo not in (
  select codigo_fabricante
  from producto
);
#ejer13//Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre from fabricante f
where exists (
  select 1
  from producto p
  where p.codigo_fabricante = f.codigo
);
#ejer14//Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre
from fabricante f
where not exists (
  select 1
  from producto p
  where p.codigo_fabricante = f.codigo
);
#ejer15//Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

select f.nombre as nombre_fabricante, p.nombre as nombre_producto, p.precio
from fabricante f
join producto p on p.codigo_fabricante = f.codigo
where p.precio = (
  select max(p2.precio) from producto p2
  where p2.codigo_fabricante = f.codigo
)
order by f.nombre;
#ejer16//Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
select * from producto p1
where precio >= (
  select avg(precio)
  from producto p2
  where p2.codigo_fabricante = p1.codigo_fabricante
);
#ejer17//Lista el nombre del producto más caro del fabricante Lenovo.
select nombre from producto
where codigo_fabricante = (
  select codigo
  from fabricante
  where nombre = 'Lenovo'
)
order by precio desc
limit 1;
#ejer18//Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
select nombre from fabricante f
where (
select count(*) from producto p
where p.codigo_fabricante = f.codigo
) = (
  select count(*) from producto p2
  where p2.codigo_fabricante = (
    select codigo
    from fabricante
    where nombre = 'Lenovo'
  )
);
