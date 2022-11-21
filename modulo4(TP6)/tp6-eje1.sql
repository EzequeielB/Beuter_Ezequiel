DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado  boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
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

/* 
1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades (id,nombre, cp,id_provincia). Tener en cuenta que:
● En un país hay muchas provincias.
● En una provincia hay muchas localidades 
*/

CREATE TABLE paises (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);

CREATE TABLE provincias (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
idpais INT UNSIGNED NOT NULL,
FOREIGN KEY (idpais) REFERENCES paises(id)
);

CREATE TABLE localidades (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cp VARCHAR(10) NOT NULL,
nombre VARCHAR(30) NOT NULL,
id_provincia INT UNSIGNED NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincias(id)
);

/*
2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
●direccion (varchar)
●id_localidad (pk localidad) –Esta es un relación con la tabla localidades
●email
●telefono
●fecha_ingreso
●tms (timestamp)
*/

ALTER TABLE empleados
ADD COLUMN direccion VARCHAR (20),
ADD COLUMN id_localidad INT UNSIGNED NOT NULL,
ADD FOREIGN KEY (id_localidad) REFERENCES localidades(id),
ADD COLUMN email VARCHAR (100),
ADD COLUMN telefono VARCHAR (12),
ADD COLUMN fecha_ingreso DATE,
ADD COLUMN tms TIMESTAMP
;

/*
3. Modificar la tabla de departamentos  usando ALTER TABLE y agregar los campos:
●gasto (double)
●tms (timestamp)
*/

ALTER TABLE departamentos
ADD COLUMN gastos DOUBLE,
ADD COLUMN tms TIMESTAMP
;

/*
4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.
*/

INSERT INTO paises VALUES 
(1, 'Argentina'),
(2, 'Brasil'),
(3, 'Chile'),
(4, 'Canada'),
(5, 'Mexico');

INSERT INTO provincias VALUES 
(1, 'Misiones', 1),
(2, 'Mendoza', 1),
(3, 'Salta', 1),
(4, 'Neuquen', 1),
(5, 'Jujuy', 1);

INSERT INTO localidades VALUES 
(1, 'N3300', 'Posadas', 1),
(2, 'M5500', 'Mendoza(Capital)', 2),
(3, 'A4400', 'Salta(Capital)', 3),
(4, 'N8300', 'Neuquen(Capital)', 4),
(5, 'N3308', 'Candelaria', 1);

INSERT INTO departamentos VALUES 
(1, 'Sistemas', 150000, true, 32600, '2020-01-15 04:00:00'),
(2, 'Desarrollo', 120000, true, 26500, '2020-02-14 04:00:00'),
(3, 'Recursos Humanos', 280000, true, 25612, '2020-03-25 04:00:00'),
(4, 'Contabilidad', 110000, true, 53600, '2020-04-13 04:00:00'),
(5, 'I+D', 375000, true, 25036, '2020-05-12 04:00:00'); 

INSERT INTO empleados VALUES 
(1, '27-32481596-', 'Marcos', 'Rivero', 2, TRUE,'Calle 120 Casa 4050', 1, 'empleado1@gmail.com','3764225523','2022-04-25', '2020-01-15 04:00:00'),
(2, '27-29557532-', 'Adela', 'Salas', 3, TRUE, 'Calle 120 Casa 2050', 1, 'empleado2@gmail.com','3764225523', '2022-06-16', '2020-02-14 04:00:00'), 
(3, '20-36970642-', 'Diego', 'Flores', 4, TRUE, 'Calle 120 Casa 2020', 2, 'empleado3@gmail.com','3764225523', '2022-05-20', '2020-02-19 04:00:00'),
(4, '20-41705545-', 'Anna', 'Burna', 5, TRUE,'Calle 120 Casa 3500', 3, 'empleado4@gmail.com','3764225523', '2022-07-25', '2020-04-12 04:00:00'),
(5, '20-17087203-', 'Juan', 'Antonio', 1, TRUE, 'Calle 120 Casa 4060', 5, 'empleado5@gmail.com','3764225523', '2022-06-30', '2020-04-18 04:00:00'); 


/*
5- 
Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
*/

RENAME TABLE pedidos TO movimientos;

/*
6. Agregar las entidades:
● Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
● Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
● Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica),
cuit,id_localidad fk, estado,tms)
● Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos.
Un proveedor está en una localidad.
*/

CREATE TABLE cajas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
horainicio TIME,
horacierre TIME,
estado BOOLEAN,
tms TIMESTAMP
);

CREATE TABLE proveedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
razon_social VARCHAR(30) NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
naturaleza VARCHAR(10) NOT NULL,
cuit VARCHAR(20),
id_localidad INT UNSIGNED NOT NULL,
FOREIGN KEY (id_localidad) REFERENCES localidades(id),
estado BOOLEAN,
tms TIMESTAMP
);

CREATE TABLE marcas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
imagen BLOB,
id_proveedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id),
estado BOOLEAN,
tms TIMESTAMP
);

CREATE TABLE productos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
id_marca INT UNSIGNED NOT NULL,
FOREIGN KEY (id_marca) REFERENCES marcas(id),
stock INT,
precio INT,
estado BOOLEAN,
tms TIMESTAMP
);

/*
7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse
secuencialmente y no fallar.
*/

INSERT INTO cajas VALUES 
(1, '06:00 ', '14:00' , TRUE,'2020-01-15 04:00:00'),
(2, '12:00' , '19:00' , TRUE,'2020-07-16 04:00:00'),
(3, '08:00' , '16:00' , TRUE,'2020-06-18 04:00:00'),
(4, '16:00' , '20:00' , TRUE,'2020-05-20 04:00:00'),
(5, '06:00' , '12:00' , TRUE,'2020-02-25 04:00:00');

INSERT INTO proveedores VALUES 
(1, 'SI', 'Lucas' , 'Martinez','Fisica','27-32481596-3', 1, TRUE ,'2020-01-15 04:00:00'),
(2, 'SI', 'Marco' , 'Lolaya','Fisica','20-34638446-3', 2, TRUE ,'2020-02-14 04:00:00'),
(3, 'SI', 'Pepe' , 'Ruiz','Fisica','27-44123836-1', 1, TRUE ,'2020-05-16 04:00:00'),
(4, 'SI', 'Juan' , 'Gómez','Fisica','20-38265162-3', 4, TRUE ,'2020-04-20 04:00:00'),
(5, 'SI', 'Irene' , 'Salas','Fisica','20-38265162-1', 3, TRUE ,'2020-02-14 04:00:00');

INSERT INTO marcas VALUES 
(1, 'Cocacola', 'Bebida Gaseosa' , '', 1, TRUE ,'2020-01-15 04:00:00'),
(2, 'Pepsi', 'Bebida Gaseosa' , '', 2, TRUE ,'2020-02-14 04:00:00'),
(3, 'Fanta', 'Bebida Gaseosa' , '', 3, TRUE ,'2020-05-16 04:00:00'),
(4, 'Nido', 'Lacteo' , '', 4, TRUE ,'2020-04-20 04:00:00'),
(5, 'Peegles', 'Snack' , '', 5, TRUE ,'2020-02-14 04:00:00');

INSERT INTO productos VALUES 
(1, 'Cocacola', 'Bebida Gaseosa' , 1, 120, 250, TRUE ,'2020-01-15 04:00:00'),
(2, 'Pepsi', 'Bebida Gaseosa' , 2, 120, 220, TRUE ,'2020-02-14 04:00:00'),
(3, 'Fanta', 'Bebida Gaseosa' , 1, 120, 250, TRUE ,'2020-05-16 04:00:00'),
(4, 'Nido', 'Lacteo' , 4, 200, 120, TRUE ,'2020-04-20 04:00:00'),
(5, 'Peegles', 'Snack' , 5, 150, 200, TRUE ,'2020-02-14 04:00:00');

/*
8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los
departamentos con estado activo o 1.
*/

USE elsistema; 
SELECT nombre, presupuesto, gastos, SUM(presupuesto-gastos) AS diferencia FROM departamentos WHERE estado=1 GROUP BY nombre;

/*
9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre
del pais y el nombre de la localidad 
*/

USE elsistema; 
SELECT paises.nombre, localidades.nombre FROM provincias
JOIN paises
ON  idpais = paises.id
JOIN localidades
ON provincias.id = id_provincia 
;
/*
10. Modificar (UPADTE):
● el telefono de un empleado cuando el id es igual a uno que hayan declarado.
● el fecha_ingreso y la localidad de otro empleado.
*/

UPDATE empleados 
SET telefono=3764225752
WHERE idemplaedo = 1;

UPDATE empleados 
SET fecha_ingreso = '2022-06-12', id_localidad = 2 
WHERE idemplaedo = 2;

/*11. Insertar 5 vendedores.*/

INSERT INTO vendedores VALUES 
(1, 'Martin', 'Lopez' , 20-4148122-1, 0.13),
(2, 'Marta', 'Herrera' , 27-40481736-1, 0.10),
(3, 'Uma', 'Ferreira' , 20-31481370-7, 0.05),
(4, 'Emiliano', 'Aguirres' , 20-32521596-3, 0.12),
(5, 'Ivan', 'Vega' , 20-4148122-1, 0.11);

/*12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado,
tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)*/

ALTER TABLE movimientos
ADD COLUMN id_producto INT UNSIGNED NOT NULL,
ADD FOREIGN KEY (id_producto) REFERENCES productos(id),
ADD COLUMN tms TIMESTAMP,
ADD COLUMN estado BOOLEAN,
ADD COLUMN tipo_movimiento VARCHAR (12)
;

/*13. Insertar 5 movimientos distintos.*/

INSERT INTO clientes VALUES 
(1, 'Marcos', 'Palacios', '27-38771523-1', 'Posadas', 100),
(2, 'Maximiliano', 'Aguirres', '24-42481327-3', 'Obera', 120),
(3, 'Martina', 'Lopez', '20-27436152-2', 'Iguazu', 200),
(4, 'Adriana', 'Ayala', '20-40159624-3', 'Apostoles', 120),
(5, 'Alicia', 'Ferreira', '24-38481296-3', 'Posadas', 150);



INSERT INTO movimientos VALUES 
(1, 50, '2020-01-15' , 1, 2, 2, '2020-01-15 04:00:00', TRUE,'ingreso'),
(2, 40, '2020-01-15' , 2, 1, 3, '2020-02-14 04:00:00',TRUE, 'egreso'),
(3, 60, '2020-01-15' , 1, 4, 1, '2020-05-16 04:00:00',TRUE, 'pedido'),
(4, 80, '2020-01-15' , 4, 5, 4, '2020-04-20 04:00:00',TRUE, 'pedido'),
(5, 90, '2020-01-15' , 5, 3, 5,'2020-02-14 04:00:00',TRUE, 'egreso');

/*
14. Borrar lógicamente (UPDATE de la columna estado):
● 2 movimientos que fueron cargados mal
● un pais que tenga al menos 3 localidades
*/

UPDATE movimientos
SET estado = FALSE
WHERE id =5;

UPDATE movimientos
SET estado = FALSE
WHERE id =4;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM paises WHERE id = 2;
SET SQL_SAFE_UPDATES = 1;

/*
15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla
de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de
manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber
5 updates de la tabla producto.
*/

UPDATE productos, 
(SELECT SUM(stock+cantidad) AS resultado FROM productos 
JOIN movimientos
ON id_producto = productos.id
WHERE productos.id=2
GROUP BY id_producto) AS calculo
SET productos.stock = resultado
WHERE id= 2;

UPDATE productos, 
(SELECT SUM(stock-cantidad) AS resultado FROM productos 
JOIN movimientos
ON id_producto = productos.id
WHERE productos.id=1
GROUP BY id_producto) AS calculo
SET productos.stock = resultado
WHERE id= 1;

UPDATE productos, 
(SELECT SUM(stock-cantidad) AS resultado FROM productos 
JOIN movimientos
ON id_producto = productos.id
WHERE productos.id=3
GROUP BY id_producto) AS calculo
SET productos.stock = resultado
WHERE id= 3;

UPDATE productos, 
(SELECT SUM(stock-cantidad) AS resultado FROM productos 
JOIN movimientos
ON id_producto = productos.id
WHERE productos.id=4
GROUP BY id_producto) AS calculo
SET productos.stock = resultado
WHERE id= 4;

UPDATE productos, 
(SELECT SUM(stock-cantidad) AS resultado FROM productos 
JOIN movimientos
ON id_producto = productos.id
WHERE productos.id=5
GROUP BY id_producto) AS calculo
SET productos.stock = resultado
WHERE id= 5;

SELECT * FROM productos;

/*16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)*/

CREATE TABLE parametros (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tms TIMESTAMP,
cosas JSON NOT NULL,
id_usuario INT UNSIGNED 
);

/* Insertar en la tabla parametros teniendo en cuenta la columna cosas:*/

INSERT INTO parametros VALUES 
(1, '2020-01-15 04:00:00', '{"idDeLaCosa": 101, "permisos": "PUT, GET"}' , 1),
(2, '2020-01-15 04:00:00', '{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente",
“grupo": "ventas"}' , 2),
(3, '2020-01-15 04:00:00', '{"zonaHoraria": "America/Argentina/BuenosAires"}' , 3),
(4, '2020-01-15 04:00:00', '{"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":
"Diciembre"}' , 4),
(5, '2020-01-15 04:00:00', '{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":
"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":
"31634912,57","egreso": "9757142,66"}}}' , 5);
