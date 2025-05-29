#ejer01 //Lista el nombre de todos los productos que hay en la tabla producto
select * from parcial.producto;
#ejer02 //Lista los nombres y los precios de todos los productos de la tabla producto
select nombre, precio from parcial.producto;
#ejer03 //Lista todas las columnas de la tabla producto.
select * from parcial.producto;
#ejer04 //Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select  nombre, precio *0.8432 ,precio from parcial.producto;