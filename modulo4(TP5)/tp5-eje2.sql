DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);
INSERT INTO clientes VALUES(1, 'Aarón', 'Rivero', '20-4148122-1', 'Garuhape',
100);
INSERT INTO clientes VALUES(2, 'Adela', 'Salas', '27-42482596-3', 'Capiovi',
200);
INSERT INTO clientes VALUES(3, 'Adolfo', 'Rubio', '23-37928596-3', 'Posadas',
NULL);
INSERT INTO clientes VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO clientes VALUES(5, 'Marcos', 'Loyola', '24-42481327-3', 'Posadas',
200);
INSERT INTO clientes VALUES(6, 'María', 'Santana', '27-38771523-1', 'Obera',
100);
INSERT INTO clientes VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO clientes VALUES(8, 'Pepe', 'Ruiz', '20-27436152-2', 'Iguazu', 200);
INSERT INTO clientes VALUES(9, 'Guillermo', 'López', '20-42481328-1',
'Andresito', 225);
INSERT INTO clientes VALUES(10, 'Daniel', 'Santana', '20-40159624-3',
'Apostoles', 125);
INSERT INTO vendedores VALUES(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15);
INSERT INTO vendedores VALUES(2, 'Juan', 'Gómez', '20-39231523-3', 0.13);
INSERT INTO vendedores VALUES(3, 'Diego','Flores', '20-38481221-3', 0.11);
INSERT INTO vendedores VALUES(4, 'Marta','Herrera', '27-40481736-1', 0.14);
INSERT INTO vendedores VALUES(5, 'Antonia','Carretero', '20-31481370-7', 0.12);
INSERT INTO vendedores VALUES(6, 'Manuel','Domínguez', '20-29876342-3', 0.13);
INSERT INTO vendedores VALUES(7, 'Antonio','Vega', '20-32521596-3', 0.11);
INSERT INTO vendedores VALUES(8, 'Alfredo','Ruiz', '20-42436477-3', 0.05);
INSERT INTO pedidos VALUES(1, 150.5, '2020-10-05', 5, 2);
INSERT INTO pedidos VALUES(2, 270.65, '2019-09-10', 1, 5);
INSERT INTO pedidos VALUES(3, 65.26, '2022-10-05', 2, 1);
INSERT INTO pedidos VALUES(4, 110.5, '2021-08-17', 8, 3);
INSERT INTO pedidos VALUES(5, 948.5, '2021-09-10', 5, 2);
INSERT INTO pedidos VALUES(6, 2400.6, '2021-07-27', 7, 1);
INSERT INTO pedidos VALUES(7, 5760, '2018-09-10', 2, 1);
INSERT INTO pedidos VALUES(8, 1983.43, '2021-10-10', 4, 6);
INSERT INTO pedidos VALUES(9, 2480.4, '2019-10-10', 8, 3);
INSERT INTO pedidos VALUES(10, 250.45, '2018-06-27', 8, 2);
INSERT INTO pedidos VALUES(11, 75.29, '2021-08-17', 3, 7);
INSERT INTO pedidos VALUES(12, 3045.6, '2022-04-25', 2, 1);
INSERT INTO pedidos VALUES(13, 545.75, '2022-01-25', 6, 1);
INSERT INTO pedidos VALUES(14, 145.82, '2022-02-02', 6, 1);
INSERT INTO pedidos VALUES(15, 370.85, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(16, 2389.23, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(17, 275.93, '2021-08-17', 2, 5);
INSERT INTO pedidos VALUES(18, 328.34, '2021-08-17', 1, 3);
INSERT INTO pedidos VALUES(19, 1838.66, '2020-03-19', 3, 4);
INSERT INTO pedidos VALUES(20, 2598.23, '2020-05-21', 5, 1);




/*1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.*/

SELECT * FROM pedidos ORDER BY fecha DESC;

/*2. Devuelve todos los datos de los dos pedidos de mayor valor.*/

SELECT * FROM pedidos ORDER BY cantidad DESC LIMIT 2;

/*3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.*/

SELECT DISTINCT id_cliente, clientes.id FROM pedidos
JOIN clientes
ON id_cliente = clientes.id 
;

/*4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya cantidad total sea superior a $500.*/

SELECT * FROM pedidos WHERE cantidad >= 500 AND  fecha BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59';

/*5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11*/

SELECT nombre, apellido, comisión FROM vendedores WHERE comisión BETWEEN'0.05' AND '0.11';

/*6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.*/

SELECT MAX(comisión) FROM vendedores;

/*7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.*/

SELECT nombre, apellido, id FROM clientes  WHERE cuitcuil IS NOT NULL ORDER BY nombre, apellido ASC;

/*8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.*/

SELECT nombre, apellido FROM clientes WHERE nombre LIKE 'A%' '%N' OR nombre LIKE 'p%' ORDER BY nombre ASC;

/*9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá estar ordenado alfabéticamente.*/

SELECT nombre, apellido FROM clientes WHERE nombre NOT LIKE 'A%' ORDER BY nombre ASC;

/*10.Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en cuenta que se deberán eliminar los nombres repetidos.*/

SELECT DISTINCT nombre, apellido FROM vendedores WHERE nombre LIKE '%el' OR nombre LIKE '%O' ORDER BY nombre ASC;

/*11.Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.*/

SELECT DISTINCT id_cliente, clientes.id, nombre, apellido FROM pedidos
JOIN clientes
ON id_cliente = clientes.id 
ORDER BY nombre ASC
;

/*12.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.*/

SELECT * FROM pedidos 
JOIN clientes
ON id_cliente = clientes.id
ORDER BY nombre ASC;

/*13.Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe mostrar los datos de los vendedores ordenados alfabéticamente.*/

SELECT * FROM pedidos 
JOIN vendedores
ON id_vendedor = vendedores.id 
ORDER BY nombre ASC;

/*14.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los vendedores asociados a cada pedido.*/

SELECT * FROM pedidos 
JOIN clientes
ON id_cliente = clientes.id
JOIN vendedores
ON id_vendedor = vendedores.id;

/*15.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo monto esté entre $300  y $1000.*/

SELECT nombre, apellido, fecha, cantidad FROM pedidos 
JOIN clientes
ON id_cliente = clientes.id
WHERE cantidad BETWEEN '500' AND '1000'  AND  fecha BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59';

/*16.Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido realizado por María Santana.*/

SELECT clientes.nombre, clientes.apellido, vendedores.nombre, vendedores.apellido FROM pedidos 
JOIN clientes
ON id_cliente = clientes.id
JOIN vendedores
ON id_vendedor = vendedores.id
WHERE clientes.nombre = 'Maria' AND clientes.apellido = 'Santana';

/*17.Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez.*/

SELECT clientes.nombre, clientes.apellido, vendedores.nombre, vendedores.apellido FROM pedidos 
JOIN clientes
ON id_cliente = clientes.id
JOIN vendedores
ON id_vendedor = vendedores.id
WHERE vendedores.nombre = 'Daniel' AND vendedores.apellido= 'Sáez';

/*18.Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.*/

SELECT * FROM pedidos 
RIGHT JOIN clientes
ON id_cliente = clientes.id
;

/*19.Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han realizado. Este listado también debe incluir los vendedores que no han realizado ningún
pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.*/

SELECT * FROM pedidos 
RIGHT JOIN vendedores
ON id_vendedor = vendedores.id
ORDER BY nombre, apellido ASC;

/*20.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.*/

SELECT * FROM pedidos 
RIGHT JOIN clientes
ON id_cliente = clientes.id
WHERE id_cliente IS NULL;

/*21.Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.*/

SELECT * FROM pedidos 
RIGHT JOIN vendedores
ON id_vendedor = vendedores.id
WHERE id_vendedor IS NULL;

/*22.Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y
el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.*/

SELECT nombre AS 'Nombre_Cliente', apellido AS 'Apellido_Cliente', NULL AS 'Nonbre_Vendedor', NULL AS 'Apellido_Vendedor' FROM pedidos 
RIGHT JOIN clientes
ON id_cliente = clientes.id 
WHERE id_cliente IS NULL

UNION

SELECT NULL, NULL, nombre, apellido FROM pedidos 
RIGHT JOIN vendedores
ON id_vendedor = vendedores.id
WHERE id_vendedor IS NULL;

/*23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.*/

SELECT SUM(cantidad) AS cantidad_total FROM pedidos;

/*24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.*/

SELECT SUM(cantidad) DIV 2 AS cantidad_total FROM pedidos;

/*25.Calcula el número total de vendedores distintos que aparecen en la tabla pedido.*/

SELECT COUNT(nombre) AS CantidadDeVendedores FROM vendedores;

/*26.Calcula el número total de clientes que aparecen en la tabla cliente.*/

SELECT COUNT(nombre) AS CantidadDeClientes FROM clientes;

/*27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.*/

SELECT MAX(cantidad) AS MaximaCantidad FROM pedidos;

/*28.Calcula cuál es la menor cantidad que aparece en la tabla pedido.*/

SELECT MIN(cantidad) AS MinimaCantidad FROM pedidos;

/*29.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.*/

SELECT categoría AS CategoriaMaxima , ciudad FROM clientes WHERE categoría=(SELECT MAX(categoría) FROM clientes);

/*30.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellido, la fecha y el valor de la cantidad.*/

SELECT nombre, apellido, fecha, MAX(cantidad) FROM pedidos 
RIGHT JOIN clientes
ON id_cliente = clientes.id
GROUP BY fecha, nombre
;

/*31.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000.*/

SELECT nombre, apellido, fecha, MAX(cantidad) AS Maxima_Cantidad FROM pedidos 
RIGHT JOIN clientes
ON id_cliente = clientes.id
WHERE cantidad>2000 GROUP BY fecha, nombre
;

/*32.Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.*/

SELECT nombre, apellido, fecha, MAX(cantidad) AS Maxima_Cantidad FROM pedidos 
RIGHT JOIN vendedores
ON id_cliente = vendedores.id
WHERE fecha='2021-08-17' GROUP BY fecha, nombre
;

/*33.Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.*/

SELECT clientes.id,nombre, apellido, COUNT(pedidos.id) AS Numero_de_Pedidos FROM pedidos 
RIGHT JOIN clientes
ON id_cliente = clientes.id
GROUP BY nombre
;

/*34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de pedidos que ha realizado cada uno de clientes durante el año 2020.*/

SELECT clientes.id,nombre, apellido, COUNT(pedidos.id) AS Numero_de_Pedidos FROM pedidos 
RIGHT JOIN clientes
ON id_cliente = clientes.id
WHERE YEAR(fecha)=2020 GROUP BY nombre
;

/*35.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.*/

SELECT fecha,  nombre, apellido, MAX(cantidad) FROM pedidos 
JOIN clientes
ON id_cliente = clientes.id
GROUP BY YEAR(fecha) ORDER BY fecha DESC
;

/*36.Devuelve el número total de pedidos que se han realizado cada año.*/

SELECT  YEAR(fecha) AS Año, COUNT(YEAR(fecha)) AS Numero_de_Pedidos FROM pedidos 
JOIN clientes
ON id_cliente = clientes.id
GROUP BY YEAR(fecha) ORDER BY fecha DESC
;

/*37.Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).*/

SELECT * FROM pedidos WHERE id_cliente = (SELECT clientes.id FROM clientes WHERE clientes.id=2);

/*38.Devuelve el número de pedidos en los que ha participado el vendedor Daniel Santana. (Sin utilizar INNER JOIN)*/

SELECT COUNT(id_cliente) AS NúmeroDeDPedidos FROM pedidos WHERE id_cliente = (SELECT clientes.id FROM clientes WHERE clientes.id=10);

/*39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)*/

SELECT * FROM clientes where clientes.id = (SELECT id_cliente FROM pedidos WHERE fecha BETWEEN '2020-01-01' AND '2020-12-31' HAVING MAX(cantidad));

/*40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.*/

SELECT cantidad,fecha  FROM pedidos WHERE id_cliente = (SELECT id FROM clientes WHERE id=7) HAVING MIN(cantidad);

/*41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).*/

SELECT * FROM pedidos 
RIGHT JOIN clientes
ON id_cliente = clientes.id
WHERE clientes.id IN ((select clientes.id WHERE id_cliente IS NULL))
;

/*42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).*/

SELECT * FROM pedidos 
RIGHT JOIN vendedores
ON id_vendedor = vendedores.id
WHERE vendedores.id IN ((select vendedores.id WHERE id_vendedor IS NULL))
;

/*43.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).*/

SELECT * FROM pedidos 
RIGHT JOIN clientes
ON id_cliente = clientes.id
WHERE EXISTS ((select clientes.id WHERE id_cliente IS NULL))
;

/*44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).*/

SELECT * FROM pedidos 
RIGHT JOIN vendedores
ON id_vendedor = vendedores.id
WHERE EXISTS ((select vendedores.id WHERE id_vendedor IS NULL))
;
