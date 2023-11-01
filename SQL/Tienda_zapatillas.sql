 CREATE SCHEMA `tienda_zapatillas`;
 USE `tienda_zapatillas`;
 CREATE TABLE `zapatillas` 
 (
 id_zapatilla INT AUTO_INCREMENT PRIMARY KEY,
 modelo VARCHAR(45) NOT NULL,
 color VARCHAR(45) NOT NULL
 );
 
 CREATE TABLE `clientes`
 (
 id_cliente INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(45) NOT NULL,
 numero_telefono SMALLINT NOT NULL,
 email VARCHAR(45) NOT NULL,
 direccion VARCHAR(45) NOT NULL,
 ciudad VARCHAR(45) NOT NULL,
 provincia VARCHAR(45) NOT NULL,
 pais VARCHAR(45) NOT NULL,
 codigo_postal SMALLINT NOT NULL
 );
 
 CREATE TABLE `empleados`
 (
 id_empleado INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(45) NOT NULL,
 tienda VARCHAR(45) NOT NULL,
 salario INT NOT NULL, 
 -- el salario seria mejor un float
 fecha_incorporacion DATE NOT NULL
 );
 
 CREATE TABLE `facturas`
 (
 id_factura INT AUTO_INCREMENT PRIMARY KEY,
 numero_factura VARCHAR(45) NOT NULL,
 fecha DATE NOT NULL,
 id_zapatilla INT NOT NULL ,
 id_empleado INT NOT NULL,
 id_cliente INT NOT NULL,
 CONSTRAINT `condicion_1`
	FOREIGN KEY (id_zapatilla) REFERENCES `zapatillas`(id_zapatilla) 
	ON DELETE RESTRICT
	ON UPDATE RESTRICT,
    FOREIGN KEY (id_empleado) REFERENCES `empleados`(id_empleado) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    FOREIGN KEY (id_cliente) REFERENCES `clientes`(id_cliente) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
 );