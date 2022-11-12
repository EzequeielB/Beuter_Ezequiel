
DROP DATABASE IF EXISTS ejercicio4;
CREATE DATABASE ejercicio4;
USE ejercicio4;

/*Ejercicio 1*/

CREATE TABLE alumno
(
Cod_Matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
DNI VARCHAR(12) NOT NULL,
FechaDeNacimiento DATE NOT NULL,
email VARCHAR(80) NOT NULL
);

CREATE TABLE profesor
(
id_Profesor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Especialidad VARCHAR(50) NOT NULL,
email VARCHAR(80)NOT NULL
);

CREATE TABLE curso
(
Cod_Curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Cod_Matricula INT NOT NULL,
FOREIGN KEY (Cod_Matricula) REFERENCES alumno(Cod_Matricula),
id_Profesor INT,
FOREIGN KEY (id_Profesor) REFERENCES profesor(id_Profesor)
);

INSERT INTO alumno VALUES 
(1,"Juaquin","44.756.789","2003-03-25","Alumno@gmail1"), 
(2,"Victoria","44.827.751","2003-01-01","Alumno@gmail2"),
(3,"Erica","44.772.752","2003-03-25","Alumno@gmail3");

INSERT INTO profesor VALUES 
(1,"Pablo","Matematicas","Profesor@gmail1"),
(2,"Martin","Sociales","Profesor@gmail1"),
(3,"Leah","Naturales","Profesor@gmail3"); 

INSERT INTO curso VALUES 
(1,"Matematicas",1,1), 
(2,"Naturales",1,3),
(3,"Sociales",2,2);

/*Ejercicio 2*/
  
CREATE TABLE empleado
(
id_Empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
DNI VARCHAR(12) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Teléfono VARCHAR(20),
Email VARCHAR(80) NOT NULL,
Fecha_Alta DATE NOT NULL
);

 CREATE TABLE localidad
(
Codigo_Localidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Codigo_Postal VARCHAR(10) NOT NULL,
id_Empleado INT ,
FOREIGN KEY (id_Empleado) REFERENCES empleado(id_Empleado)
);

 CREATE TABLE provincia
(
ip_Provincia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre_Provincia VARCHAR(20) NOT NULL,
Codigo_Localidad INT NOT NULL,
FOREIGN KEY (Codigo_Localidad) REFERENCES localidad(Codigo_Localidad)
);

 CREATE TABLE pais
(
ip_Pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Nombre_Pais VARCHAR(20) UNIQUE NOT NULL,
ip_Provincia INT,
FOREIGN KEY (ip_Provincia) REFERENCES provincia(ip_Provincia)
);

INSERT INTO empleado VALUES
(1, 44655722, 'Diego', '+54-93764322545', 'empleado1@gamil,com','2010-09-10'),
(2, 44752342, 'Martin', '+54-93764563219', 'empleado2@gamil,com','2011-05-25'),
(3, 44452952, 'Elena', '+54-93764221125', 'empleado3@gamil,com','2012-07-12');

INSERT INTO localidad VALUES
(1, 'Posadas', 'N3000', '2'),
(2, 'Corrientes', 'W3400', '3'),
(3, 'Neuquen', 'N8300', '1');

INSERT INTO provincia VALUES
(1, 'Misiones', 1),
(2, 'Corrientes', 2),
(3, 'Neuquen', 3);

INSERT INTO pais VALUES
(1, 'Argentina', 1);


/* Ejercicio 3*/

CREATE TABLE Cliente
(
id_Cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
DNI VARCHAR(12) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Dirección VARCHAR(60),
Telefono VARCHAR(20) NOT NULL
);

 CREATE TABLE Auto
(
Matricula varchar(7) NOT NULL PRIMARY KEY,
Modelo VARCHAR(10) NOT NULL,
Color VARCHAR(10) NOT NULL,
Marca VARCHAR(20) NOT NULL,
Precio_X_Hora INT NOT NULL,
Gasolina_Litros INT NOT NULL
);

 CREATE TABLE Pedido
(
ip_Pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Fecha_Inicial DATE NOT NULL,
Final_Reserva DATE NOT NULL,
Precio_total INT NOT NULL,
Avalado_Por VARCHAR(50) NOT NULL,
id_Cliente INT ,
FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente),
Matricula VARCHAR(7) ,
FOREIGN KEY (Matricula) REFERENCES Auto(Matricula)
);

INSERT INTO Cliente VALUES
(1, 44655722, 'Santiago', 'Calle 124 Casa 1140', '+54-93764756824'),
(2, 44752342, 'Erika', 'Calle 124 Casa 1222', '+54-93764459682'),
(3, 44452952, 'Irene', 'Calle 124 Casa 1220', '+54-93764468695');


INSERT INTO Auto VALUES
('AAA 123', 'Onix', 'Negro', 'Chevrolet', 300, 80),
('JBT 254', 'Tracker', 'Gris', 'Chevrolet', 400, 100),
('HKJ 524', 'Cruze', 'Blanco', 'Chevrolet', 800, 120);

INSERT INTO Pedido VALUES
(1, "2003-03-25", "2003-03-25", 100000, 'María Rosas', 2, 'JBT 254'),
(2, "2003-03-25", "2003-03-25", 200000, 'Eduardo Martinez', 2, 'AAA 123'),
(3, "2003-03-25", "2003-03-25", 300000, 'Eduardo Martinez', 1, 'HKJ 524');


